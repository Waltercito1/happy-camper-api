class List < ApplicationRecord
    has_many :categories
    has_many :items, :through => :categories
end
