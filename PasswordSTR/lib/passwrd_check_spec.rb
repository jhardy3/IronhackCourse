require 'rspec'
require './passwrd_check'


describe 'PasswordChecker' do

  let(:validator) {PasswordChecker.new("Default@Default.com", "notAtypPW@1")}

  # Make function that checks if valid password
  describe 'validate_pw' do
    it 'validates a password' do

      expect(validator.validate_pw).to eq(true)
    end
  end

  describe 'character_length?' do
    it 'validates character length' do
      expect(validator.character_length?).to eq(true)
    end
  end

  # Make function that checks for 1 letter, 1 number and 1 symbol
  describe 'check_let_sym_num?' do
    it 'validates that there is 1 letter, 1 number and 1 symbol' do
      expect(validator.check_let_sym_num?).to eq(true)
    end
  end

  describe 'check_domain_email?' do
    it 'checks to make sure someone is not using their name or domain in pw' do
      expect(validator.check_domain_email?).to eq(true)
    end
  end

  # Make function that checks for name or domain of email in password


end





















describe "PasswordValidator" do

  let(:validator) { PasswordValidator.new("jhardy3@live.com", "DefaultPassword1&") }

  describe 'validate' do
    it "it validates a password" do

      expect(validator.validate?).to eq(true)
    end

    it "it validates an incorrect password username check" do
      vali = PasswordValidator.new("rafa@ironhack.com", "12rafaT$LLL")

      expect(vali.validate?).to eq(false)
    end

    it "it validates an incorrect password domain check" do
      vali = PasswordValidator.new("rafa@ironhack.com", "12ironhackT$LLL")

      expect(vali.validate?).to eq(false)
    end
  end

  describe 'contains_case' do
    it "validates the casing" do
      expect(validator.contains_case?).to eq(true)
    end
  end

  describe 'contains_sym' do
    it "validates the sym" do
      expect(validator.contains_sym?).to eq(true)
    end
  end

  describe 'doesnt_contain_email' do
    it "validates the password does not contain email" do
      expect(validator.contains_sym?).to eq(true)
    end
  end

  describe 'contains_chars' do
    it "validates chars" do
      expect(validator.contains_chars?).to eq(true)
    end
  end

end
