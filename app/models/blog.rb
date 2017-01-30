class Blog < ActiveRecord::Base
	belongs_to :user
	validates :content, presence: true, length: { maximum: 140 }
	validates :title, presence: true, length: { maximum: 80 }
end
