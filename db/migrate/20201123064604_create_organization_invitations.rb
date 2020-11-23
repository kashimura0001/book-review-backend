class CreateOrganizationInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_invitations, id: :uuid do |t|
      t.references :organization, type: :uuid, null: false, foreign_key: true
      t.references :organization_role, type: :uuid, null: false, foreign_key: true
      t.string :invite_code, null: false, limit: 255
      t.string :email, null: false, limit: 255
      t.integer :status, null: false
      t.datetime :invited_at, null: false

      t.timestamps
    end
    add_index :organization_invitations, :invite_code, unique: true
  end
end
