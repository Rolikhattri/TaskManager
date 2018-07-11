class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :task_name
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
  end
end
