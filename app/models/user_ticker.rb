class UserTicker < ApplicationRecord
	validates_presence_of :ticker
	before_save :ticker_to_upper
	belongs_to :user

	def ticker_to_upper
		self.ticker.upcase!
	end
end
