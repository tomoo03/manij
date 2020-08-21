class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2],
         password_length: 8..32
  validates :name, presence: true, uniqueness: true
  has_many :goals, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :teams, through: :memberships
  has_many :activated_memberships, -> { where(activate: true) }, class_name: 'Membership'
  has_many :activated_teams, through: :activated_memberships, source: :team
  has_many :deactivated_memberships, -> { where(activate: false) }, class_name: 'Membership'
  has_many :deactivated_teams, through: :deactivated_memberships, source: :team
  has_many :project_tasks
  has_many :project_comments, dependent: :destroy

  def self.activated_users(team, user)
    team.activated_users.where.not(id: user.id)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
