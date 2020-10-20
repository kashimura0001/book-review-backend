class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :uuid, null: false
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end

    add_index :users, :uuid, unique: true
    add_index :users, :email, unique: true
  end
end
