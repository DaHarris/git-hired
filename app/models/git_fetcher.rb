class GitFetcher
  attr_reader :client

  def initialize
    @client = Octokit::Client.new(:access_token => ENV["GITHUB_ACCESS_TOKEN"])
    @user = @client.user
    @user.login
  end

  def name(uid)
    @client.user(uid).name
  end

  def email(uid)
    @client.user(uid).email
  end

  def repositories(uid)
    @client.repositories(uid)
  end

end
