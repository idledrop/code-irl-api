class CodeSerializer < ActiveModel::Serializer
  attributes :id, :url, :up, :down
  has_many :tags
end
