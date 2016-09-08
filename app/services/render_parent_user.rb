class RenderParentUser

  def self.login(jwt, user)
    {jwt: jwt, current_user: user, type: user.type, account: {
      parent: user.associated_user,
      network: user.associated_user.network_hash,
      network_requests: user.associated_user.network_requests,
      confirmed_bookings: user.associated_user.confirmed_bookings,
      requested_bookings: user.associated_user.requested_bookings
    }}
  end

  def self.retreive_current_user(user)
    {current_user: user, account: {
      parent: user.associated_user,
      network: user.associated_user.network_hash,
      network_requests: user.associated_user.network_requests,
      confirmed_bookings: user.associated_user.confirmed_bookings,
      requested_bookings: user.associated_user.requested_bookings
    }}
  end

  def self.current_viewable_user(user, current_user_id)
    {viewable_user: user, type: user.type, account: {
      parent: user.associated_user,
      network: user.associated_user.network(current_user_id)
    }}
  end


end
