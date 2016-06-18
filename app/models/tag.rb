class Tag < ApplicationRecord
  has_many :code_tags
  has_many :codes, :through => :code_tags
  validate :name, :presence => true

end
