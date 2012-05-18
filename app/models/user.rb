class User < ActiveRecord::Base
  
  has_many :posts
  
  #Include this for paperclip
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_attachment :avatar, :presence => true,
    :content_type => { :content_type => "image/jpeg" },
    :size => { :in => 0..100.kilobytes }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar
  # attr_accessible :title, :body
end
