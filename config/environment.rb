# Load the Rails application.
require_relative "application"


# Initialize the Rails application.
Rails.application.initialize!

# # Update the preview_path= option to preview_paths=
# if Rails::VERSION::MAJOR >= 7
#   Rails.application.config.action_mailer.preview_paths = [Rails.root.join('test/mailers/previews')]
# else
#   Rails.application.config.action_mailer.preview_path = Rails.root.join('test/mailers/previews')
# end

