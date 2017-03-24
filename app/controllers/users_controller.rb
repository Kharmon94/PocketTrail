class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end
end


# instead of params[:ticker]

# @user.user_tickers.map{|t| t.ticker}
