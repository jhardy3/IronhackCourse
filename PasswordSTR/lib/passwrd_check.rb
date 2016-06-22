class PasswordValidator

  def initialize(email, password)
    @email = email
    @password = password
  end

  # The password must be longer than 7 characters
  # The password must contain at least 1 letter, 1 number and 1 symbol (e.g. "#", "%", etc)
  # The password must contain at least 1 uppercase and 1 lowercase letter
  # The password must NOT contain neither the name nor the domain of the email.

  def validate?
    contains_chars? && doesnt_contain_email? && contains_sym? && contains_case?
  end

  def contains_chars?
    if /[a-z]/ =~ @password || /[A-Z]/ =~ @password
      true
    else
      false
    end
  end

  def doesnt_contain_email?
    split = @email.split("@")
    domain = split[1]
    domain.slice!(".com")
    name = split[0]
    !(@password.include?(name) || @password.include?(domain))
  end

  def contains_sym?
    if @password =~ /[@|!|#|$|%|^|&|*]/
      true
    else
      false
    end
  end

  def contains_case?
    @password != @password.upcase && @password != @password.downcase
  end

end


class PasswordChecker
  def initialize(email, password)
    @email = email
    @password = password
  end

# Make function that checks if valid password
  def validate_pw
    character_length? && check_let_sym_num? && check_domain_email?
  end

# Make function that checks character length
  def character_length?
    @password.length > 7
  end

# Make function that checks for 1 letter, 1 number and 1 symbol
  def check_let_sym_num?
    if /[A-Z]/ =~ @password && /[a-z]/ =~ @password && /\d/ =~ @password && /[~|!|@|#|$|%|^|&|*]/ =~ @password
      true
    else
      false
    end
  end

# Make function that checks for name or domain of email in password
  def check_domain_email?
    email_array = @email.split("@")
    email_array = email_array[1].split(".")
    domain = email_array[1][0]
    name = email_array[0]

    !(@password.include?(name) || @password.include?(name))

  end

end
