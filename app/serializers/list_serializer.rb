class ListSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :categories
  has_many :items, :through => :categories
end
