class RenameTypeToKind < ActiveRecord::Migration[6.0]
  def change
    rename_column :sports, :type, :kind
  end
end
