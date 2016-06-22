class LoginService

  users = {
    Jake: "123",
    Fred: "456",
    Dane: "789",
    Luke: "1011"
    Chris: "1213"
  }

  def initialize(username, password)
    @username = username
    @password = password
  end

  def logIn
    if users[@username.to_sym] == @password
      true
    else
      false
    end
  end

  private

  attr_reader :username, :password

end
