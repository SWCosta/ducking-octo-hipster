class Directory < Node

  attr_writer :basename
  
  belongs_to :directory
  has_many :subdirs, :class_name => "Directory",
                     :foreign_key => "directory_id"

  validates_presence_of :name
  validates_presence_of :basename
  #TODO: validate uniqueness

  before_validation :set_name
  before_save :set_basename

  def basename
    @basename || (name.nil? ? nil : name.split(/\//).last)
  end

  def fullname
    name.slice(1..-1)
  end

  #def basename
  #  basename = name.to_s.split(/\//).last
  #  "/" if basename.nil? && directory.nil?
  #end

  ##def fullname
  ##  #TODO: do that on the filesystem rather the db
  ##  directory.present? ? File.join(directory.fullname, name).sub(/^\//,"") : ""
  ##end
  #
  private

  def set_name
    dirname = directory.nil? ? "" : directory.name
    self.name = File.join(dirname.to_s,basename.to_s).sub(/^(?=[^\/])/,"/")
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

