module UsersHelper
  def avatar(user, size=48)
    "#{user.avatar_url}?s=#{size}&d=mm"
  end

  def current_user?(user)
    user and user.id == current_user.id
  end
end
