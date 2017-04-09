class AddGroupRefToHealthReport < ActiveRecord::Migration[5.0]
  def change
    add_reference :health_reports, :group, index: true, foreign_key: true
  end
end
