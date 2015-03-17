class LinkedinFetcher

  attr_reader :conn

  def initialize(user)
    @conn = Faraday.new(:url => "https://api.linkedin.com") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    @current_user = user
  end

  def get_education
    @education = @conn.get "/v1/people/~:(educations)?" do |request|
      request.params["format"] = "json"
      request.headers = {"Authorization"=>"Bearer #{@current_user.token}"}
    end
    @education = JSON.parse(@education.body)

    @education["educations"]["values"].each do |x|
      ed = Education.new()
      ed.user_id = @current_user.id
      ed.field_of_study = x["fieldOfStudy"]
      ed.degree = x["degree"]
      ed.degree_date = x["endDate"]["year"]
      ed.school = x["schoolName"]
      ed.save
    end
  end

  def get_skills
    @skills = @conn.get "/v1/people/~:(skills)?" do |request|
      request.params["format"] = "json"
      request.headers = {"Authorization"=>"Bearer #{@current_user.token}"}
    end
    @skills = JSON.parse(@skills.body)

    @skills["skills"]["values"].each do |x|
      sk = Skill.new()
      sk.user_id = @current_user.id
      sk.name = x["skill"]["name"]
      sk.save
    end
  end

  def get_positions
    @positions = @conn.get "/v1/people/~:(three-current-positions)?" do |request|
      request.params["format"] = "json"
      request.headers = {"Authorization"=>"Bearer #{@current_user.token}"}
    end
    @positions = JSON.parse(@positions.body)

    @positions["threeCurrentPositions"]["values"].each do |x|
      pos = Employment.new()
      pos.user_id = @current_user.id
      pos.company = x["company"]["name"]
      pos.title = x["title"]
      pos.current = true
      pos.save
    end
  end

  def get_past_positions
    @past_positions = @conn.get "/v1/people/~:(three-past-positions)?" do |request|
      request.params["format"] = "json"
      request.headers = {"Authorization"=>"Bearer #{@current_user.token}"}
    end
    @past_positions = JSON.parse(@past_positions.body)

    @past_positions["threePastPositions"]["values"].each do |x|
      pos = Employment.new()
      pos.user_id = @current_user.id
      pos.company = x["company"]["name"]
      pos.title = x["title"]
      pos.current = false
      pos.save
    end
  end
end
