class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :user_id
  acts_as_commentable
  
end
