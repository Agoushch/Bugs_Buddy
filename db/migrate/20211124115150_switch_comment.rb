class SwitchComment < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_activities, :comment_id
    add_reference :comments, :user_activity
  end
end
