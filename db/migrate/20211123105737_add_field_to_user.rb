class AddFieldToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :description, :text
    add_column :users, :gender, :string
    add_column :users, :age, :integer
  end
end
