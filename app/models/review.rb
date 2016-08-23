class Review < ApplicationRecord
  belongs_to :parent
  belongs_to :babysitter

  def self.joins_table
    Review.joins(:parent_babysitter)
  end
end
