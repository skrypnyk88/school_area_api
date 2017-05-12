class ResetPasswordWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    ResetPasswordMailer.reset_password_instructions(user).deliver
  end
end
