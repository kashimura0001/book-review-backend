class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :firebase_uid, null: false, limit: 255
      t.string :name, null: false, limit: 100
      t.string :email, null: false, limit: 255
      t.string :avatar_url, limit: 255

      t.timestamps
    end
    add_index :users, :firebase_uid, unique: true
    add_index :users, :email, unique: true
  end
end
