class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :project_id
      t.string :name
      t.string :title
      t.string :description
      t.datetime :deadline_at, :default => Time.now
      t.timestamps
    end
  end
end
