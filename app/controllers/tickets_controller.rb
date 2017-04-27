class TicketsController < ApplicationController
	require 'csv'
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
	@stock = params[:ticker].upcase

	end

	# chart info
	# def chart
	#   @stock = params[:ticker].upcase
	#    raise "error" unless @stock && @stock.length > 0
	#    uri = URI( 'http://chart.finance.yahoo.com/table.csv' )
	#   uri.query = URI.encode_www_form(
	#     s: @stock,        # s - stock symbol to look up
	#     a: 6,             # a - start month
	#     b: 1,             # b - start day
	#     c: 2016,          # c - start year
	#     d: Date.today.month,             # d - end month
	#     e: Date.today.day,            # e - end day
	#     f: Date.today.year,          # f - end year
	#     g: 'd',           # g - d (daily), m (monthly), y (yearly)
	#     ignore: '.csv'
	#   )
	#   p uri
	#   @output = Net::HTTP.get_response( uri ).body 
 # 	end 



	def destroy
		current_user.user_tickers.find_by(ticker: params[:ticker]).destroy
		# respond_to do |format|
		# 	format.json { status: 'Ok' }
		# end
		redirect_to request.referer
	end
end
