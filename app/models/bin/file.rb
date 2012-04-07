class Bin::File < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name
  validates_inclusion_of :user_id, :in => User.all.map(&:id)

  mount_uploader :file, FileUploader

  def self.model_name
    ActiveModel::Name.new(Bin::File,Bin,"file")
  end
end
