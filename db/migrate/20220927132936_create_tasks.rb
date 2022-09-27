class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :title
      t.string :description
      t.date :deadline
      t.date :date_of_start

      t.timestamps
    end
  end
end
