class Comment < ActiveRecord::Base
  attr_accessible :comment, :message_id
  belongs_to :message
end
