class User < ActiveRecord::Base
  has_many :projects
  has_many :skills
  has_many :employments
  has_many :educations

  def self.create_with_omniauth(auth, code)
    @current = create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.location = auth["info"]["location"]["name"]
      user.linkedin_url = auth["info"]["urls"]["public_profile"]
      user.picture_url = auth["info"]["image"]
      user.email = auth["info"]["email"]
      user.description = auth["info"]["description"]
      user.token = auth["credentials"]["token"]
    end
    get_info = LinkedinFetcher.new(@current)
    get_info.get_skills
    get_info.get_education
    get_info.get_positions
    get_info.get_past_positions
    return @current
  end
end
