class LinkedinFetcher

  attr_reader :conn

  def initialize
    @conn = Faraday.new(:url => "https://api.linkedin.com") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def get_education
    current_user = User.first
    @profile = @conn.get "/v1/people/~:(id,first-name,skills,educations,languages,twitter-accounts)?" do |request|
      request.params["format"] = "json"
      request.headers = {"Authorization"=>"Bearer #{current_user.token}"}
    end
  end
end
