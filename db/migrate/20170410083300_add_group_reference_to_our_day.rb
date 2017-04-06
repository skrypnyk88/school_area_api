class AddGroupReferenceToOurDay < ActiveRecord::Migration[5.0]
  def change
    add_reference :our_days, :group, index: true, foreign_key: true
  end
end
