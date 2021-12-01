class AddEquipmentToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :equipment, :string
  end
end
