# Use this hook to configure devise mailer, warden hooks and so forth.
Devise.setup do |config|
  config.secret_key = ENV['SECRET_KEY_BASE']
  # Configure the e-mail address which will be shown in Devise::Mailer
  config.mailer_sender = 'example.com'
  # ==> ORM configuration
  require 'devise/orm/active_record'
  # Configure which authentication keys should be case-insensitive.
  config.case_insensitive_keys = [:email]
  # Configure which authentication keys should have whitespace stripped.
  config.strip_whitespace_keys = [:email]
  # skip storage for particular strategies by setting this option.
  config.skip_session_storage = [:http_auth, :jwt]
  # ==> Configuration for :database_authenticatable
  # For bcrypt, this is the cost for hashing the password and defaults to 11
  config.stretches = Rails.env.test? ? 1 : 11
  # ==> Configuration for :confirmable
  # If true, requires any email changes to be confirmed
  config.reconfirmable = true
  # ==> Configuration for :rememberable
  # Invalidates all the remember me tokens when the user signs out.
  config.expire_all_remember_me_on_sign_out = true
  # ==> Configuration for :validatable
  config.password_length = 6..128
  # Email regex used to validate email formats.
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  # ==> Configuration for :recoverable
  # Time interval you can reset your password with a reset password key.
  config.reset_password_within = 6.hours
  # ==> Navigation configuration
  # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :delete

  config.warden do |manager|
    manager.strategies.add :jwt, Devise::Strategies::JWT
    manager.default_strategies(scope: :user).unshift :jwt
    manager.failure_app = Devise::JwtFailureApp
  end
end
