
Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']

end

if Rails.env.development?
  OmniAuth.config.full_host = 'https://localhost:3000'
end

# provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
#   scope: 'email',
#   prompt: 'select_account',
#   client_options: {
#     ssl: { ca_file: Rails.root.join("cacert.pem").to_s },
#     authorize_url: "https://accounts.google.com/o/oauth2/auth?prompt=consent"
#   }
# }

OmniAuth.config.before_request_phase = lambda { |env|
  csrf_token = ActionController::RequestForgeryProtection.new(nil).form_authenticity_token(env['rack.session'])
  env['rack.session']['_csrf_token'] = csrf_token
}


# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
# end
