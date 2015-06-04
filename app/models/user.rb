class User < ActiveRecord::Base
  has_many :projects, dependent: :destroy
  has_many :repos, dependent: :destroy
  has_many :employments, dependent: :destroy
  has_many :looking_fors, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :jobs, dependent: :destroy

  enum role: [:employee, :employer, :admin]
  has_many :skills, dependent: :destroy
  has_many :educations, dependent: :destroy

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

  def current_employer
    employments.where(current: true).first
  end
end
