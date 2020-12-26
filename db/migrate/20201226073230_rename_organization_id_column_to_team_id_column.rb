class RenameOrganizationIdColumnToTeamIdColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :books, :organization_id, :team_id
    rename_column :reviews, :organization_id, :team_id
    rename_column :team_members, :organization_id, :team_id
  end
end
