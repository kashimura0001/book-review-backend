class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books, id: :uuid do |t|
      t.references :team, type: :uuid, null: false, foreign_key: true
      t.string :isbn, limit: 255
      t.string :title, limit: 100, null: false
      t.string :author, limit: 100, null: false
      t.string :image_url, limit: 255, null: false

      t.timestamps

      t.index :isbn, unique: true
    end
  end
end
