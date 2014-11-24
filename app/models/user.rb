class User < ActiveRecord::Base
  before_save { email.downcase! }
  before_save { username.downcase! }

  authenticates_with_sorcery!

  validates :password,                length: { minimum: 6 }, if: lambda { new_record? || !password.nil? }
  validates :password,                confirmation: true
  validates :password_confirmation,   presence: true, if: lambda { new_record? || !password.nil? }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-zA-Z\d\-]+(?:\.[a-zA-Z\d\-]+)*\.[a-zA-Z]+\z/i
  validates :email,                   uniqueness: { case_sensitive: false },
                                      format: { with: VALID_EMAIL_REGEX }

  VALID_USERNAME_REGEX = /\A[a-zA-Z]\w*\z/i
  validates :username,                length: { in: 4..20 },
                                      uniqueness: { case_sensitive: false },
                                      format: { with: VALID_USERNAME_REGEX }

  mount_uploader :avatar, AvatarUploader

  def self.find_for_oauth(auth)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      p '--------- already registered with oauth -----------'
      return user
    else
      p '--------- already registered -----------'
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        p '--------- creating user with oauth -----------'
        password = friendly_token
        user = User.new(username: omniauth_username(auth),
                        provider:auth.provider,
                        uid:auth.uid,
                        email:auth.info.email,
                        password:password,
                        password_confirmation:password,
                        friendly_token: true
                      )
        user.send_activation_email = false
        user.save
        user.activate!
        return user
      end
    end
  end

  attr_accessor :send_activation_email

  def send_activation_needed_email!
    super if send_activation_email
  end

  ###############################

  private

  def self.omniauth_username(auth)
    provider = auth.provider
    if provider == 'github'
      username = auth.info.nickname
    else
      username = auth.extra.raw_info.name.gsub(/ /,'_').downcase  #gsub(changes regex / / into '_')
    end
  end

  def self.friendly_token
    SecureRandom.urlsafe_base64(15).tr('lIO0', 'sxyz')
  end

end
