require 'spec_helper'

describe Directory do
  pending "add some examples to (or delete) #{__FILE__}"
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

