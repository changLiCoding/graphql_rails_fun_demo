module Types
  class SubscriptionType < Types::BaseObject
    field :on_user, Types::UserType, null: false do
      description "A user was created need to get the last one"
    end
    def on_user
      # Create a channel to stream new user data
      channel = SecureRandom.uuid

      # Create a subscription that listens to new user creation events
      subscription = -> (_obj, _args, _ctx) do
        {
          on_user: {
            id: SecureRandom.uuid,
            name: User.last.name,
            email: User.last.email,
            postsCount: User.last.posts_count
          }
        }
      end
    # Subscribe to new user creation events and yield the results to the client
      {
        on_user: -> {
          ActiveSupport::Notifications.subscribe('user.created') do |*args|
            event = ActiveSupport::Notifications::Event.new(*args)
            User.new(event.payload[:user]).tap do |user|
              ActionCable.server.broadcast(channel, subscription.call(nil, nil, nil))
            end
          end

          # Return an Async Iterator that yields the last created user
          Async::Iteration::AsyncAdapter.from_enumerator Enumerator.new do |yielder|
            ActionCable.server.remote_connections.where(current_user: nil).each do |remote|
              remote.transmit({ data: subscription.call(nil, nil, nil) }, { channel: channel })
            end

            loop do
              ActiveSupport::Notifications.instrument('user.created', user: User.last)
              yielder << subscription.call(nil, nil, nil)
              sleep 1
            end
          end
        }
      }
    end
  end
end
