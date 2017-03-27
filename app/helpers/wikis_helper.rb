module WikisHelper
  def user_is_authorized_for_wiki?(wiki)
    !wiki.private || wiki.user == current_user
  end
end
