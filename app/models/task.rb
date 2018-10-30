class Task < ApplicationRecord
    has_many :task_details
    has_many :users, through: :task_details
end
