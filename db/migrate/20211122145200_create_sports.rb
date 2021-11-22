class CreateSports < ActiveRecord::Migration[6.0]
  def change
    create_table :sports do |t|
      t.string :type
      t.string :category

      t.timestamps
    end
  end
end
