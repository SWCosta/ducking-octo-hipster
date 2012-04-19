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

  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :inactive
    else 
      super # Use whatever other message 
    end 
  end

  def self.send_reset_password_instructions(attributes={})
    # TODO: remove ugly error message is 'send instructions' dialog
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.inactive")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable

  private

  def create_root_directory
    Directory.create!(:user_id => self.id, :name => "/")
  end
end
