class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews, id: :uuid do |t|
      t.references :organization, type: :uuid, null: false, foreign_key: true
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :book, type: :uuid, null: false, foreign_key: true
      t.string :title, null: false, limit: 100
      t.text :body, null: false

      t.timestamps
    end
  end
end
