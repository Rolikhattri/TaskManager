class AddTeamLeadToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :team_lead, :boolean
  end
end
