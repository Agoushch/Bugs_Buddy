class ChangeDataTypeForActivityDate < ActiveRecord::Migration[6.0]
  def change
    change_column :activities, :date, :datetime

  end
end
