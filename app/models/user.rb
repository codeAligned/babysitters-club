class User < ApplicationRecord
  has_secure_password
  has_one :babysitter
  has_one :parent
end
