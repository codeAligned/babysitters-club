class RenderBabysitterUser

  def self.login(jwt, user)
    {jwt: jwt, current_user: user, type: user.type, account: {
      babysitter: user.associated_user,
      network: user.associated_user.network,
      network_requests: user.associated_user.network_requests,
      confirmed_bookings: user.associated_user.confirmed_bookings,
      requested_bookings: user.associated_user.requested_bookings
    }}
  end

end
