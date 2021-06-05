class ListSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :categories #, serializer: CategorySerializer
  #has_many :items, :through => :categories
end
