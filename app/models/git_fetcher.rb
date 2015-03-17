class GitFetcher
  attr_reader :client

  def initialize
    @client = Octokit::Client.new(:access_token => ENV["GITHUB_ACCESS_TOKEN"])
    @user = @client.user
    @user.login
  end

  def name(username)
    @client.user(username).name
  end

  def email(username)
    @client.user(username).email
  end

  def get_repos(username)
    @client.user(username).get_repos
  end

end
