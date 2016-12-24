# handles User and Session logic for signing in
class UserSession
  attr_reader :user, :password

  def initialize(options = {})
    @happy_path = options[:happy_path]
    @error_path = options[:error_path]
    @email      = options[:input][:email]
    @password   = options[:input][:password]
    @user       = User.find_by(email: @email)
  end

  def valid?
    user && user.authenticate(password)
  end

  def id
    user? ? user.id : nil
  end

  def message
    if user?
      "Welcome #{user.handle}"
    else
      'Error please try again'
    end
  end

  def path
    if user?
      @happy_path
    else
      @error_path
    end
  end

  private

  def user?
    user
  end
end
