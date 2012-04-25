class Directory < Node

  def find_by_name(name)
    tree_of_id_and_name
    map_to_id_and_name(self.subtree.arrange)
  end

#  def tree_of_id_and_name
#    hash = {}
#    tree = subtree
#    subtree.each do |dir, subdirs|
#      hash[dir.name] = ""
#    self.subtree.arrange.inject([]) do |array, (dir, subdir)|
#      array.push(dir.name)
#      array.push(nil)
#    end
#  end

  def name_tree
    items = subtree.reorder("created_at").ordered_by_ancestry
    debugger
    items.inject(ActiveSupport::OrderedHash.new) do |arranged_nodes, node|
      node.ancestor_ids.inject(arranged_nodes) do |insertion_point, ancestor_id|
        insertion_point.each do |parent,children|
          insertion_point = children if parent[0] == ancestor_id
        end
        insertion_point
      end[[node.id, node.name, node.parent_id]] = ActiveSupport::OrderedHash.new
      arranged_nodes
    end
  end

  def children_tree
    tree = {}
    children.each do |child|
      tree[child.name] = child.children_tree
    end
    tree 
  end
      

#  attr_writer :basename
#  
#  belongs_to :directory
#  has_many :subdirs, :class_name => "Directory",
#                     :foreign_key => "directory_id"
#
#  validates_presence_of :name
#  validates_presence_of :basename
#  #TODO: validate uniqueness
#
#  before_validation :set_name
#
#  def basename
#    @basename || (name.nil? ? nil : name.split(/\//).last)
#  end
#
#  def fullname
#    name.slice(1..-1)
#  end
#
#  #def basename
#  #  basename = name.to_s.split(/\//).last
#  #  "/" if basename.nil? && directory.nil?
#  #end
#
#  ##def fullname
#  ##  #TODO: do that on the filesystem rather the db
#  ##  directory.present? ? File.join(directory.fullname, name).sub(/^\//,"") : ""
#  ##end
#  #
#  private
#
#  def set_name
#    dirname = directory.nil? ? "" : directory.name
#    self.name = File.join(dirname.to_s,basename.to_s).sub(/^(?=[^\/])/,"/")
#  end
end
# == Schema Information
# Schema version: 20120419110829
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
#
# Indexes
#
#  index_nodes_on_ancestry  (ancestry)
#

