Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "49edede147ee0a8548fb", "317bf44d939de09d9da1115479223c9f85f4538b", scope: "user,repo"
end

