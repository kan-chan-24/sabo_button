class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :completion_count

      t.timestamps
    end
  end
end
