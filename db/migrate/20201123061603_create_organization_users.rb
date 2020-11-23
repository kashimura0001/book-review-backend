class CreateOrganizationUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_users, id: :uuid do |t|
      t.references :organization, type: :uuid, null: false, foreign_key: true
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :organization_role, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
