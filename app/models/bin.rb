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
