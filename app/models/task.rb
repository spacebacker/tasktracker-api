# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  status      :text             default("open"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  assignee_id :bigint           not null
#  creator_id  :bigint           not null
#  project_id  :bigint           not null
#
# Indexes
#
#  index_tasks_on_assignee_id  (assignee_id)
#  index_tasks_on_creator_id   (creator_id)
#  index_tasks_on_name         (name)
#  index_tasks_on_project_id   (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (assignee_id => users.id)
#  fk_rails_...  (creator_id => users.id)
#  fk_rails_...  (project_id => projects.id)
#
class Task < ApplicationRecord
  belongs_to :project
  belongs_to :assignee, class_name: :User, foreign_key: :assignee_id
  belongs_to :creator, class_name: :User, foreign_key: :creator_id

  default_scope { order(created_at: :desc) }
end
