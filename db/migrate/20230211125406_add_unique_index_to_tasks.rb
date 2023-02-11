class AddUniqueIndexToTasks < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, [:name, :user_id], unique: true
  end
end
