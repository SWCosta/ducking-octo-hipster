class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :approved, :manufactured

  has_many :nodes
  has_one :root_dir, :class_name => "Directory", :conditions => "name = '/'"

  before_validation :set_random_password, :if => proc { new_record? && manufactured? }
  after_create :create_root_directory, :send_mail

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
  end

  private

  def create_root_directory
    Directory.create!(:user_id => self.id, :name => "/")
  end

  def send_mail
    if manufactured?
      RegistrationMailer.welcome_email(self,@random_password).deliver
    else
      RegistrationMailer.wait_for_activation_email(self).deliver
    end
  end

  def set_random_password
    @random_password = User.send(:generate_token, "encrypted_password").slice(0..8)
    self.password = @random_password
  end
end
# == Schema Information
# Schema version: 20120427190351
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  approved               :boolean         default(FALSE), not null
#  manufactured           :boolean         default(FALSE)
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_approved              (approved)
#

