class CommentsController < ApplicationController
	def new
		@messageid = params[:messageid]
		@message = params[:message]
	end

	def create
		@messageid = params[:id]
		@comment = params[:comment]
		Comment.create({message_id: @messageid, comment: @comment})
		redirect_to "/index"
	end
end
