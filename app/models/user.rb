class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :nodes
  has_one :root_dir, :class_name => "Directory", :conditions => "name = '/'"

  after_create :create_root_directory

  private

  def create_root_directory
    Directory.create!(:user_id => self.id, :name => "/")
  end
end
