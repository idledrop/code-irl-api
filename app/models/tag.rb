class Tag < ApplicationRecord
  has_many :code_tags
  has_many :codes, :through => :code_tags
  validates_presence_of :name

end
