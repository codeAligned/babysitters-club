require 'jwt'

class Auth
  ALGORITHM = 'HS256'
  def self.issue(payload)
    JWT.encode(
      payload,
      auth_secret,
      ALGORITHM)
  end

  def self.decode
    JWT.decode(token,
      auth_secret,
      true,
      { algorithm: ALGORITHM }).first
  end

  def self.auth_secret
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  end

end
