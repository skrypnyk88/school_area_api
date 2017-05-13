class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :gender
      t.string :phone
      t.string :type
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps
    end
  end
end
