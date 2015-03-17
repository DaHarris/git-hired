class GitFetcher
  attr_reader :client

  def initialize
    @client = Octokit::Client.new(:access_token => ENV["GITHUB_ACCESS_TOKEN"])
    @user = @client.user
    @user.login
  end

  def name(github_id)
    @client.user(github_id).name
  end

  def email(github_id)
    @client.user(github_id).email
  end

  def repositories(github_id)
    @client.repositories(github_id)
  end

end
