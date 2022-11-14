class AddColumnStateToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :state, :string, default: :not_started
  end
end
