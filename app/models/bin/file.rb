class Bin::File < ActiveRecord::Base
  validates_presence_of :name

  def self.model_name
    ActiveModel::Name.new(Bin::File,Bin,"file")
  end
end
