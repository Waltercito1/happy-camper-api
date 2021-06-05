class Category < ApplicationRecord
    belongs_to :list
    has_many :items
end