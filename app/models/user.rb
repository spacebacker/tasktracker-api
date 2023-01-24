# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#
class User < ApplicationRecord
  has_many :assigned_tasks, foreign_key: :assignee_id, class_name: :Task, dependent: :destroy
  has_many :created_tasks, foreign_key: :creator_id, class_name: :Task, dependent: :destroy
  has_many :projects, dependent: :destroy

  has_secure_password
  
  validates :password, presence: true
  validates :name, presence: true

  validates :email, presence: true, uniqueness: true, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'has already been registered'
  }
end
