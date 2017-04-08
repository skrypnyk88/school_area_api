class JsonWebToken
  def self.encode(user)
    JWT.encode(payload(user), Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
       .with_indifferent_access
  end

  def self.payload(user)
    exp_time = Time.now.to_i + 60
    { exp: exp_time, user_id: user.id, type: user.type }
  end
end
