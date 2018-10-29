class User < ActiveRecord::Base
	validates :username, presence: true, length: { minimum: 1, maximum:50 }
	validates :username, uniqueness: true
	validates :password, presence: true, length: { minimum: 1, maximum:50 }
end