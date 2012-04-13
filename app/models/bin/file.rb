module Bin
  class File < ActiveRecord::Base
    belongs_to :user

    validates_presence_of :name
    validates_inclusion_of :user_id, :in => User.all.map(&:id)

    default_scope order(:file)
    scope :under, proc{ |dir| where(:dir => dir) }

    before_save :write_properties

    mount_uploader :file, FileUploader

    def self.model_name
      ActiveModel::Name.new(Bin::File,Bin,"file")
    end

    private

    def write_properties
      #TODO: write file_size, name
    end

  end
end
