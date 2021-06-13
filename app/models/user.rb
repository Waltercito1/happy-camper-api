class User < ApplicationRecord
    has_many :lists

    validates :name, presence: true, uniqueness: true
end
