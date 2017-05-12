class AddResetPasswordTokenToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
    end
  end
end
