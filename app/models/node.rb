class Node < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name
  validates_inclusion_of :user_id, in: User.all.map(&:id)

  default_scope order(:name)
end
