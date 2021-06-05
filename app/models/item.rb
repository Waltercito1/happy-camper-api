class Item < ApplicationRecord
  belongs_to :category
  belongs_to :list, :foreign_key => :category_id
end
