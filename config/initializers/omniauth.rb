Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Railstar.env["twitter_key"], Railstar.env["twitter_secret"]
end
