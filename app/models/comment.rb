class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :content, presence: true

  after_create :notify_task_assignee

  private

  def notify_task_assignee
    assignee = task.assignee
    return unless assignee && assignee != user

    Notification.create(
      user: assignee,
      content: #{user.name} commented on task '#{task.title}'",
      notifiable: self
    )
  end
end
