class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Linkedin login / register
  def self.connect_to_linkedin(auth, signed_in_resource=nil) 
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user 
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user 
        return registered_user 
      else 
        user = User.create(name:auth.info.nickname, provider:auth.provider, uid:auth.uid, email:auth.info.email, headline: auth.info.headline, image: auth.info.image, location: auth.info.location, url: auth.info.urls.public_profile, password:Devise.friendly_token[0,20], )
      end 
    end 
  end

  def is_current_user?
    if self === current_user
      return true
    else 
      return false
    end
  end

  # def user_infos_linkedin
  #   profile = Linkedin::Profile.new(self.url)
  #   return profile
  # end
end
