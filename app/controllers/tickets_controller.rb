class TicketsController < ApplicationController
before_action :authenticate_user!
	def details
		yahoo_client = YahooFinance::Client.new

		@data = yahoo_client.quotes( [params[:ticker]], [:symbol, :ask, :bid, :open, :previous_close, :weeks_range_52, :days_range, :volume, :average_daily_volume, :market_capitalization, :pe_ratio, :earnings_per_share, :ebitda, :revenue, :dividend_yield, :shares_outstanding, :float_shares]).first
		if @data
			@ticker = current_user.user_tickers.find_by(ticker: params[:ticker])
			unless @ticker
				@ticker = UserTicker.create(user_id: current_user.id, ticker: params[:ticker])
			end
		end
	end

	# def create
		
	# 	@user.user_tickers.each do |ticker|
	# end
	def destroy
		current_user.user_tickers.find_by(ticker: params[:ticker]).destroy
		# respond_to do |format|
		# 	format.json { status: 'Ok' }
		# end
		redirect_to request.referer
	end
end
