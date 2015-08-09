class FormUser < User
  attr_accessor :current_password
  validates :email, presence: true, if: :email_required?
  validates :email, uniqueness: true, allow_blank: true, if: :email_changed?

  validates_format_of :email, with: Devise.email_regexp, allow_blank: true, if: :email_changed?

  validates_presence_of :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of :password, within: Devise.password_length, allow_blank: true

  def password_requried?
    return false if email.blank?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def email_required?
    true
  end

  def instagram
    identities.where( :provider => 'instagram').first
  end

  def instagram_client
    @instagram_cient ||= Instagram.client( access_token: instagram.accesstoken)
  end

  def instagram_feed
    instagram_client.user_media_feed
  end

  def twitter
    identities.where( :provider => 'twitter').first
  end

  def twitter_client
    @client  ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['twitter_key']
      config.consumer_secret = ENV['twitter_secret']
      config.access_token = twitter.accesstoken
      config.access_token_secret = twitter.accesstokensecret
    end
  end

  def twitter_feed
    twitter_client.home_timeline
  end
end
