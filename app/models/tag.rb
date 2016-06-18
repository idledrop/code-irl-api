class Tag < ApplicationRecord
  has_many :code_tags
  has_many :tags, :through => :code_tags
  validates_presence_of :name

end
