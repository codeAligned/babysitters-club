class ParentSerializer < ActiveModel::Serializer
 attributes :name, :user_id, :email, :kid_count, :address, :specific_needs, :extra_requests

end
