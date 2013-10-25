class Message < ActiveRecord::Base
  attr_accessible :message, :schoolid, :theme, :schoolname, :zip
  has_many :comments
end
