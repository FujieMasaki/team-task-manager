class Task < ApplicationRecord
  belongs_to :project
  belongs_to :assignee, class_name: 'User', optional: true
  belongs_to :created_by, class_name: 'User'

  has_many :comments, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: %w(todo in_progress done) }
  validates :priority, presence: true, inclusion: { in: %w(low medium high) }

  # ステータスと優先度のenum定義
  enum status: { todo: 'todo', in_progress: 'in_progress', done: 'done' }
  enum priority: { low: 'low', medium: 'medium', high: 'high' }

  # スコープ定義
  scope :due_soon, -> { where('due_date <= ? AND due_date >= ? AND status != ?',
                              Date.today + 3.days, Date.today, 'done') }
  scope :overdue, -> { where('due_date < ? AND status != ?', Date.today, 'done') }
  scope :by_priority, -> { order(priority: :desc) }
  scope :by_status, -> { order(status: :asc) }
end
