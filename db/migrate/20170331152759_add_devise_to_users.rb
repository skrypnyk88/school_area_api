class AddDeviseToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      add_index :users, :email, unique: true
    end
  end
end
