class Node < ActiveRecord::Base
  has_ancestry

  belongs_to :user

  validates_presence_of :name, :user_id
  #validates_inclusion_of :user_id, in: User.all.map(&:id) # doesn't work properly due to caching

  #default_scope order(:name)
  #scope :subdirs, children.where(:type => "Directory")
  
  def subdirs
    children.where(:type => "Directory")
  end
end
