module WikisHelper
  def can_create_private_wikis?(user)
    user.premium? || user.admin?
  end

  def has_private_wikis?(user)
    user.wikis.each { |w| return true if w.private }
    false
  end
end
