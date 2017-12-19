class UserPresenter
  def initialize user
    @obj = ObjectPresenter.new(user.id, user.class.name, user.avatar_url, user.name, user.email, user.username)
  end

  def get_info
    @obj
  end
end