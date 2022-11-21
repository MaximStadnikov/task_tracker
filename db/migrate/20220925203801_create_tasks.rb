class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    drop_table :tasks
    create_table :tasks, if_not_exists: true do |t|
      t.string :title
      t.text :description
      t.datetime :deadline_at
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
