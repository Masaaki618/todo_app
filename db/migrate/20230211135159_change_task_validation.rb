class ChangeTaskValidation < ActiveRecord::Migration[5.2]
  def change
    remove_index :tasks, :name
    add_index :tasks, [:name, :user_id], unique: true
  end
end
