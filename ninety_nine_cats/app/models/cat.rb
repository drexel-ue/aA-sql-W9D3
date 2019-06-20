# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'action_view'
require 'action_view/helpers'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :birth_date, presence: true
    validates :color, presence: true, inclusion: { in: %w(Purple Green Teal), message: "%{value} is not a valid size" }
    validates :name, presence: true
    validates :sex, presence: true
    validates :description, presence: true


    def age
        Date.current.year - self.birth_date.year
        # DateTime.now.mjd - DateTime.parse("01-01-1995").mjd
    end

end
