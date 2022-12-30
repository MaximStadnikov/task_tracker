class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments, if_not_exists: true do |t|
      t.string :content
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
