class AddUserIdToToucs < ActiveRecord::Migration[6.1]
  def change
    add_column :toucs, :user_id, :integer
  end
end
