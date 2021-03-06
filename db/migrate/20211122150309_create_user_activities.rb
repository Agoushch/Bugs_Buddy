class CreateUserActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :user_activities do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
