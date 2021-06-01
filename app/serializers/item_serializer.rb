class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :packed
  belongs_to :category
end
