class List < ApplicationRecord
    belongs_to :user
    has_many :categories
    has_many :items, :through => :categories

    validates :title, presence: true
end