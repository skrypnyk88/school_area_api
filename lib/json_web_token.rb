module JsonWebToken
  def self.encode(user)
    JWT.encode(payload(user), Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
       .with_indifferent_access
  end

  def self.payload(user)
    exp_time = (Time.now + 30.minutes).to_i
    { exp: exp_time, user_id: user.id }
  end
end
