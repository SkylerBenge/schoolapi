class MessagesController < ApplicationController
	def new
		@schoolid = params[:schoolid]
		@zip = params[:zip]
		@schoolname = params[:schoolname]
	end

	def create
		@schoolid = params[:id]
		@zip = params[:zip]
		@schoolname = params[:schoolname]
		@theme = params[:theme]
		@message = params[:message]
		Message.create({schoolid: @schoolid, theme: @theme, message: @message,
						schoolname: @schoolname, zip: @zip})
		redirect_to "/index"
	end
end
