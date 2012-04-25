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
# == Schema Information
# Schema version: 20120425192930
#
# Table name: nodes
#
#  id           :integer         not null, primary key
#  type         :string(255)
#  name         :string(255)
#  data         :text
#  file         :string(255)
#  directory_id :integer
#  user_id      :integer
#  ancestry     :string(255)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  basename     :text
#
# Indexes
#
#  index_nodes_on_ancestry  (ancestry)
#

