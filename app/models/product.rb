class Product < ApplicationRecord
    has_and_belongs_to_many :giveaway
end
