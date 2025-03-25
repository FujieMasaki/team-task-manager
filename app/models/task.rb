class Task < ApplicationRecord
  belongs_to :project
  belongs_to :assignee
  belongs_to :created_by
end
