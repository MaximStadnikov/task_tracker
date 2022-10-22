class AddReferenceToTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :project_id
    add_reference :tasks, :project, foreign_key: true
  end
end
