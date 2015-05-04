# == Schema Information
#
# Table name: slides
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  slide_type  :integer
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Slide < ActiveRecord::Base
  belongs_to :project
  has_many :questions
  accepts_nested_attributes_for :questions

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

end
