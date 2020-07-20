class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :projects, dependent: :destroy
end
