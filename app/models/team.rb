class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :projects, dependent: :destroy
  belongs_to :admin_user, class_name: 'User'
  has_many :activated_memberships, -> { where(activate: true) }, class_name: 'Membership'
  has_many :activated_users, through: :activated_memberships, source: :user
  has_many :deactivated_memberships, -> { where(activate: false) }, class_name: 'Membership'
  has_many :deactivated_users, through: :deactivated_memberships, source: :user
end
