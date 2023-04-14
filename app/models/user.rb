class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }
  has_many :posts
  has_many :comments
  has_many :user_games
  has_many :games, through: :user_games

  def generate_token
    payload = { user_id: id, exp: Time.now.to_i + 12.hours }
    p Rails.application.secrets.secret_key_base
    JwtService.encode(payload, Rails.application.secrets.secret_key_base)
  end

  # def generate_token
  #   payload = { user_id: id }
  #   JwtService.encode(payload)
  # end
end
