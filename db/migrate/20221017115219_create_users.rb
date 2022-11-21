class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    enable_extension "citext"
    drop_table :users
    create_table :users, if_not_exists: true do |t|
      t.string :first_name
      t.string :last_name
      t.citext :email
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
