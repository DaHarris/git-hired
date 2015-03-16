Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['LINKEDIN_API_KEY'], ENV['LINKEDIN_SECRET_KEY'], :scope => 'r_fullprofile r_emailaddress r_contactinfo'
end
