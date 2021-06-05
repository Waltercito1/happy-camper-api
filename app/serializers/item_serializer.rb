class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :packed
  belongs_to :category
  belongs_to :list #, :through => :category
end
