class CreateOrganizationMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_members, id: :uuid do |t|
      t.references :organization, type: :uuid, null: false, foreign_key: true
      t.references :user, type: :uuid, null: true, foreign_key: true
      t.integer :role, null: false
      t.string :invite_code, limit: 255
      t.string :invite_email, limit: 255
      t.integer :invite_status
      t.datetime :invite_at

      t.timestamps
    end
  end
end
