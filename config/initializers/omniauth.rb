# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :developer if Rails.env.development?
#   provider :google_oauth2, ENV['243215285456-q6o8ptkfp23m0tr5pgion4k34k744p17.apps.googleusercontent.com'], ENV['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']
# end
# OmniAuth.config.allowed_request_methods = %i[get]
# OmniAuth::AuthenticityTokenProtection.default_options(key: "csrf.token", authenticity_param: "_csrf")

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
