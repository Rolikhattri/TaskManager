class AddTeamNameToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :team_name, :string
  end
end
