class Directory < Node

  #TODO: validate uniqueness

  def subdirs
    Directory.where(:ancestry => File.join(*[ancestry,id.to_s].reject{ |i| i.blank? }))
  end

  def files
    Bin.where(:ancestry => File.join(*[ancestry,id.to_s].reject{ |i| i.blank? }))
  end
  
  private

  def set_ancestry
    self.ancestry = File.join(directory.id.to_s,directory.ancestry.to_s)
  end

end
# == Schema Information
# Schema version: 20120427235442
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
#  extension    :string(255)     default("")
#  size         :integer
#
# Indexes
#
#  index_nodes_on_ancestry  (ancestry)
#

