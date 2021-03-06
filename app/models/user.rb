class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_tickers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def tickers
  	self.user_tickers.order('updated_at DESC')
  end
end
