class JwtService

  def self.encode(payload, secret_key)
    expiration = 24.hours.from_now.to_i
    payload[:exp] = expiration
    JWT.encode(payload, secret_key)
  end

  def self.decode(token, secret_key)
    decoded = JWT.decode(token, secret_key)
    HashWithIndifferentAccess.new(decoded[0])
  end

end
