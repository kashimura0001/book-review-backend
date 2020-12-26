class ChangeColumnToAllowNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :books, :image_url, null: true
    change_column_null :books, :author, null: true
  end

  def down
    change_column_null :books, :image_url, null: false
    change_column_null :books, :author, null: false
  end
end
