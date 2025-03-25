class TeamMember < ApplicationRecord
  belongs_to :team
  belongs_to :user
  validates :role, presence: true, inclusion: { in: %w(admin member) }
  validates :user_id, uniqueness: { scope: :team_id }
end
