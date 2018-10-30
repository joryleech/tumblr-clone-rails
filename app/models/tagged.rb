class Tagged < ActiveRecord::Base
	belongs_to :post
	validates :post, presence: true
	validates :tag, presence: true, length: { minimum: 1, maximum:254 }
end