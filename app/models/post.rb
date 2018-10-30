class Post < ActiveRecord::Base
	belongs_to :user
	has_many :taggeds, dependent: :destroy
	validates :title, presence: true, length: { minimum: 1, maximum:254 }
	validates :user_id, presence: true
	#0 text-post, 1-image post, 2-linkpost
	validates :post_type,presence:true, :inclusion => 0..3
end