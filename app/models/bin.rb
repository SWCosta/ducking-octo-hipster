class Bin < Node
  belongs_to :directory

  mount_uploader :file, FileUploader

  scope :under, proc{ |dir| where(:dir => dir.name) }

  before_save :write_properties

  private

  def write_properties
    #TODO: write file_size, name
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

