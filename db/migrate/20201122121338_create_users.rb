class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :firebase_uid, limit: 255, null: false
      t.string :name, limit: 100, null: false
      t.string :email, limit: 255, null: false
      t.string :avatar_url, limit: 255

      t.timestamps

      t.index :firebase_uid, unique: true
    end
  end
end
