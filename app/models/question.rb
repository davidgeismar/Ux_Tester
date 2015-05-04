# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  description :string
#  slide_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Question < ActiveRecord::Base
  belongs_to :slide
   belongs_to :project
   has_many :answers
end
