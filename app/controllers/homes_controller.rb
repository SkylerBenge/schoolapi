class HomesController < ApplicationController
	def index
	end

	def search
		@search_by = params[:search_by]
		@search = params[:search]
		request = Typhoeus::Request.new(
			'http://api.education.com/service/service.php?f=schoolSearch&key=650b9a01197f504b095d5c9c6c4e283a&sn=sf&v=4',
			method: :get,
			params: {@search_by => @search, Resf: "json"}).run
			@result = JSON.parse(request.body)
		# Pulling all the messages that have the zip code to display on views
		@messages = Message.where("zip = '"+params[:search]+"'")
	end

	def info
		@schoolid = params[:schoolid]
		request = Typhoeus::Request.new(
			'http://api.education.com/service/service.php?f=schoolSearch&key=650b9a01197f504b095d5c9c6c4e283a&sn=sf&v=4',
			method: :get,
			params: {schoolid: @schoolid, Resf: "json"}).run
			@info = JSON.parse(request.body)
		# Pulling out all of the related messages with the school
		# @messages = Message.find_by_schoolid(@schoolid)
		# @messages = Message.find(1)
		@messages = Message.where("schoolid = '"+params[:schoolid]+"'")
	end
end
