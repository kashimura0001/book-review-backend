class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books, id: :uuid do |t|
      t.references :organization, type: :uuid, null: false, foreign_key: true
      t.string :isbn, limit: 50
      t.string :title, null: false, limit: 255
      t.string :author, null: false, limit: 255
      t.string :image_url, null: false, limit: 255

      t.timestamps
    end
    add_index :books, :isbn, unique: true
  end
end
