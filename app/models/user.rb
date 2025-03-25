class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :name, presence: true

  has_many :team_members, dependent: :destroy
  has_many :teams, through: :team_members
  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assignee_id'
  has_many :created_tasks, class_name: 'Task', foreign_key: 'created_by_id'
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
end