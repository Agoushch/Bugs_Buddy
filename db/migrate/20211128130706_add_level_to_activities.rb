class AddLevelToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :level, :integer
  end
end
