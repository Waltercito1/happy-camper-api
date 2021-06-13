class ListSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :categories

  def categories
    self.object.categories.map do |cat|
      {
        id: cat.id,
        name: cat.name,
        items: cat.items.map {|i| {id: i.id, name: i.name, packed: i.packed}}
      }
    end
  end
end
