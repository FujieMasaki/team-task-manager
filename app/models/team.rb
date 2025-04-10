class Team < ApplicationRecord
    validates :name, presence: true  
    has_many :team_members, dependent: :destroy
    has_many :users, through: :team_members
    has_many :projects, dependent: :destroy
end