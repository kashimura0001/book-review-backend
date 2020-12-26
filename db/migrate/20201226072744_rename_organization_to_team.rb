class RenameOrganizationToTeam < ActiveRecord::Migration[6.0]
  def change
    rename_table :organizations, :teams
    rename_table :organization_members, :team_members
  end
end
