class HomesController < ApplicationController
	# Index is my home page
	def index
	end

	# Page that loads after user inputs a ZIP code
	def search
		# Params needed to use Education.com API
		@search_by = params[:search_by]
		@search = params[:search]
		# Typhoeus request that returns an array with all of the schools in the ZIP code 
		request = Typhoeus::Request.new(
			'http://api.education.com/service/service.php?f=schoolSearch&key=650b9a01197f504b095d5c9c6c4e283a&sn=sf&v=4',
			method: :get,
			params: {@search_by => @search, Resf: "json"}).run
			@result = JSON.parse(request.body)
		# Pulling the last 7 messages that have the zip code to display on views
		# So users can see messages across the schools in the zip before selecting a specific school
		# Limit to seven so it looks nice
		@messages = Message.where("zip = '"+params[:search]+"'").last(7)
	end

	# Page that loads after user selects a specific school in the zip code
	def info
		# Param needed to use Education.com API
		@schoolid = params[:schoolid]
		# Param used to create a back button
		@zip = params[:zip]
		# This time running a Typhoeus request for a specific school, by schoolid
		request = Typhoeus::Request.new(
			'http://api.education.com/service/service.php?f=schoolSearch&key=650b9a01197f504b095d5c9c6c4e283a&sn=sf&v=4',
			method: :get,
			params: {schoolid: @schoolid, Resf: "json"}).run
			@info = JSON.parse(request.body)
		# Pulling out all of the related messages with the school
		# Created database so every message that is created stores the unique schoolid
		# @messages = Message.find_by_schoolid(@schoolid)
		# @messages = Message.find(1)
		@messages = Message.where("schoolid = '"+params[:schoolid]+"'")
	end
end
