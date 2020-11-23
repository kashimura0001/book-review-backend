class CreateOrganizationRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_roles, id: :uuid do |t|
      t.string :role, null: false, limit: 100

      t.timestamps
    end
    add_index :organization_roles, :role, unique: true
  end
end
