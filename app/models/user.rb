class User < ApplicationRecord
  has_secure_password
  has_one :babysitter
  has_one :parent

  def associated_user
    if self.babysitter
      return self.babysitter
    elsif self.parent
      return self.parent
    end
  end

  def type
    associated_user.class.to_s
  end

  def self.joins_table_parents 
    self.joins(:parent)
  end 

  def self.joins_table_babysitter
    self.joins(:babysitter)
  end

end
