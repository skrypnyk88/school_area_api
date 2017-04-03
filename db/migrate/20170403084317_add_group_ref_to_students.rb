class AddGroupRefToStudents < ActiveRecord::Migration[5.0]
  def change
    add_reference :students, :group, index: true, foreign_key: true
  end
end
