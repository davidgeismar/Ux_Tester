# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  first_name       :string
#  last_name        :string
#  email            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  provider         :string
#  uid              :string
#  name             :string
#  oauth_token      :string
#  oauth_expires_at :string
#

class User < ActiveRecord::Base

 ##-- Requirements and Concerns ---

  ##-- Constants--------------------

  ##-- Virtual Attributes ----------

  ##-- Validations -----------------
  # validates :email, presence: true
  # validates :username, uniqueness: { case_sensitive: false }

  ##-- Callbacks -------------------

  ##-- Associations ----------------
  has_many :projects, dependent: :destroy
  # has_many :users, through: :memberships

  ##-- Scopes ----------------------
  # scope :active, -> { where(active: true) }

  ##-- Methods ---------------------

# validation

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    end
  end

end
