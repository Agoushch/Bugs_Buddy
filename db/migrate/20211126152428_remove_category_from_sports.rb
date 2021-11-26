class RemoveCategoryFromSports < ActiveRecord::Migration[6.0]
  def change
    remove_column :sports, :category
  end
end
