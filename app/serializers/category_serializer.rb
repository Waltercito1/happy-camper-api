class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  #belongs_to :list
  has_many :items
end
