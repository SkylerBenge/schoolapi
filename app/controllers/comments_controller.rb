class CommentsController < ApplicationController
	# Page that loads when a new comment is to be created
	# Messageid so Rails know what message the comment belongs to
	def new
		@messageid = params[:messageid]
		@message = params[:message]
		@schoolid = params[:schoolid]
	end

	# Creating the comment into the database
	def create
		@messageid = params[:id]
		@comment = params[:comment]
		@schoolid = params[:schoolid]
		Comment.create({message_id: @messageid, comment: @comment})
		# Redirect to the school info page after the comment is created
		redirect_to "/info?schoolid=" +@schoolid
	end
end
