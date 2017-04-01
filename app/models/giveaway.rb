class Giveaway < ApplicationRecord
    has_and_belongs_to_many :user
    has_and_belongs_to_many :product

    def choose_winners
      winners = {} 
      users = 1.upto(100).to_a
      all_applicants = users.to_a.shuffle
      JSON.parse(products).each do |product_id, quantity|
        quantity.times { winners[all_applicants.pop] = product_id }
      end
      winners
    end
end
