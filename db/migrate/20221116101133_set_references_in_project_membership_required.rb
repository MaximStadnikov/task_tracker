class SetReferencesInProjectMembershipRequired < ActiveRecord::Migration[6.1]
  def change
    change_column :project_memberships, :project_id, :bigint, null: false
    change_column :project_memberships, :user_id, :bigint, null: false
  end
end
