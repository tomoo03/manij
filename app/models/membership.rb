class Membership < ApplicationRecord
  belongs_to :team
  belongs_to :user
  def self.search(team, user)
    Membership.find_by(user_id: user.id, team_id: team.id, activate: false)
  end
end