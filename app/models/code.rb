class Code < ApplicationRecord
  has_many :code_tags
  has_many :tags, :through => :code_tags
  has_many :comments
end
