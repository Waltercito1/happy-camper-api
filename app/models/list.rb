class List < ApplicationRecord
    belongs_to :user
    has_many :categories
    has_many :items, :through => :categories

    validates :title, presence: true
    #accepts_nested_attributes_for :items

    # def list_items_attributes=(attributes) 
    #      byebug
    # end

end
