class User < ActiveRecord::Base

  def self.create_with_omniauth(auth, code)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.token = auth["credentials"]["token"]
    end
  end
end
