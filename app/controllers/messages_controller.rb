class MessagesController < ApplicationController
	# Page that loads when user wants to create a new message
	def new
		@schoolid = params[:schoolid]
		@zip = params[:zip]
		@schoolname = params[:schoolname]
	end

	# Creating the message into the database
	def create
		@schoolid = params[:id]
		@zip = params[:zip]
		@schoolname = params[:schoolname]
		@theme = params[:theme]
		@message = params[:message]
		Message.create({schoolid: @schoolid, theme: @theme, message: @message,
						schoolname: @schoolname, zip: @zip})
		# Redirecting to the info page for the school
		redirect_to "/info?schoolid=" +@schoolid
	end

	def delete
		Message.delete(params[:messageid])
		redirect_to "/index"
	end
end
