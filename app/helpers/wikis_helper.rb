module WikisHelper
  def can_create_private_wikis?(user)
    user.premium? || user.admin?
  end
end
