class Node < ActiveRecord::Base

  before_validation :set_basename, :set_fullname
  before_validation :set_user

  validates_presence_of :name, :user_id, :fullname
  validates_presence_of :basename, :if => proc { |node| node.ancestors.any? }
  #validates_inclusion_of :user_id, in: User.all.map(&:id) # doesn't work properly due to caching

  #default_scope order(:name)

  has_ancestry

  belongs_to :user

  private

  def set_basename
    self.basename = File.join(*ancestors.map(&:name))
  end

  def set_fullname
    self.fullname = File.join(basename, name.to_s)
  end

  def set_user
    !user_id ? self.user_id = parent.user_id : nil
  end
end
# == Schema Information
# Schema version: 20120426233351
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
#  fullname     :text
#
# Indexes
#
#  index_nodes_on_ancestry  (ancestry)
#

