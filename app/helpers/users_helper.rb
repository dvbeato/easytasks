module UsersHelper
  def avatar(user, size=48)
    "#{user.avatar_url}?s=#{size}&d=mm"
  end
end
