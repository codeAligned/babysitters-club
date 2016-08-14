class Review < ApplicationRecord
  belongs_to :parent_babysitter

  def self.joins_table
    Review.joins(:parent_babysitter)
  end 
end
