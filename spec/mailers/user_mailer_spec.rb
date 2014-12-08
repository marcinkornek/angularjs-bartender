require "spec_helper"

describe UserMailer do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "#activation_needed_email" do
    let(:mail) { UserMailer.activation_needed_email(@user) }

    # it "renders the headers" do
    #   expect(mail.subject).to eq("Welcome to My Awesome Site")
    #   expect(mail.to).to      eq([@user.email])
    #   expect(mail.from).to    eq(["no-reply@bartender-app.herokuapp.com"])
    # end

    # it "renders the body" do
    #   expect(mail.body.encoded).to match("Welcome to example.com, #{@user.username}")
    #   expect(mail.body.encoded).to match("your username is: #{@user.username}")
    #   expect(mail.body.encoded).to match("To login to the site, just follow this link: #{activate_api_user_url(@user.activation_token)}")
    # end

    it "renders the headers" do
      expect(mail.subject).to eq("Witamy na naszej super stronie")
      expect(mail.to).to      eq([@user.email])
      expect(mail.from).to    eq(["no-reply@bartender-app.herokuapp.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Witamy na stronie Bar, #{@user.username}")
      expect(mail.body.encoded).to match("Twój nick to: #{@user.username}")
      expect(mail.body.encoded).to match("Żeby potwierdzić rejestrację i zalogować się na stronie kliknij w link: #{activate_api_user_url(@user.activation_token)}")
    end
  end

end
