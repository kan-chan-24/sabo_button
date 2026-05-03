class AddUserIdentifierToTasks < ActiveRecord::Migration[8.1]
  def change
    add_column :tasks, :user_identifier, :string
  end
end
