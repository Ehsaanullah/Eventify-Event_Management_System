class Event < ApplicationRecord
	
    has_one_attached :image
	belongs_to :user
	has_many :enrollments
	has_many :reviews



	# Ransack
	def self.ransackable_attributes(auth_object = nil)
    	["title", "expiry_date", "location", "category"]
  	end
end
