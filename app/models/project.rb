# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  public      :boolean
#  status      :integer
#  url         :text
#  mode        :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ActiveRecord::Base
  belongs_to :user
  has_many :slides
  has_many :questions, through: :slides
  accepts_nested_attributes_for :slides
  validates :name, presence: true


  def to_param
    return "#{id}-#{name}".parameterize
  end
end
