class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  mount_uploader :avatar, AvatarUploader

  has_many :documents

  after_update { self.documents.each(&:touch) }

  include ElasticsearchSearchable
end
