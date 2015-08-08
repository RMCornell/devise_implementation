class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable

  has_many :identities

  def twitter
    identites.where(:provider => "twitter").first
  end

  def twitter_client
    @twitter_client ||= Twitter.client(access_token: twitter.accesstoken)
  end

  # Instagram User Methods
  def instagram
    identies.where( :provider => "instagram").first
  end

  def instgram_client
    binding.pry
    @instagram_client ||= Instagram.client( access_token: instagram.accesstoken )
  end

  def feed
    instagram_client.user_media_feed
  end


end
