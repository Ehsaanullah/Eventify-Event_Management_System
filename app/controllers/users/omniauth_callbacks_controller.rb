class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_auth2
    handle_auth "Google"
  end

  def handle_auth(kind)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success',kind: kind
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.auth_data'] = request.env['omniauth.auth'].exept('extra')
      redirect_to new_user_regidtration_url, alert: @user.errors.full_messages.join("\n")
    end
  end
    
end

#    def google_oauth2
#      user = User.from_google(from_google_params)

#      if user.present?
#        sign_out_all_scopes
#        flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
#        sign_in_and_redirect user, event: :authentication
#      else
#        flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
#        redirect_to new_user_session_path
#      end
#     end

#     def from_google_params
#       @from_google_params ||= {
#         uid: auth.uid,
#         email: auth.info.email
#       }
#     end

#     def auth
#       @auth ||= request.env['omniauth.auth']
#     end
# end



# //////////////////////
# frozen_string_literal: true

# class Devise::OmniauthCallbacksController < DeviseController
# class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

#   prepend_before_action { request.env["devise.skip_timeout"] = true }

#   def passthru
#     render status: 404, plain: "Not found. Authentication passthru."
#   end

#   def failure
#     set_flash_message! :alert, :failure, kind: OmniAuth::Utils.camelize(failed_strategy.name), reason: failure_message
#     redirect_to after_omniauth_failure_path_for(resource_name)
#   end

#   protected

#   def failed_strategy
#     request.respond_to?(:get_header) ? request.get_header("omniauth.error.strategy") : request.env["omniauth.error.strategy"]
#   end

#   def failure_message
#     exception = request.respond_to?(:get_header) ? request.get_header("omniauth.error") : request.env["omniauth.error"]
#     error   = exception.error_reason if exception.respond_to?(:error_reason)
#     error ||= exception.error        if exception.respond_to?(:error)
#     error ||= (request.respond_to?(:get_header) ? request.get_header("omniauth.error.type") : request.env["omniauth.error.type"]).to_s
#     error.to_s.humanize if error
#   end

#   def after_omniauth_failure_path_for(scope)
#     new_session_path(scope)
#   end

#   def translation_scope
#     'devise.omniauth_callbacks'
#   end
# end



# class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

#   def google_oauth2
#     user = User.from_omniauth(auth)
#     if user.present?
#       sign_out_all_scopes
#       flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
#       sign_in_and_redirect user, event: :authentication
#     else
#       flash[:alert] =
#         t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
#       redirect_to new_user_session_path
#     end
#   end
#   private
#   def auth
#     @auth ||= request.env['omniauth.auth']
#   end
# end



#   class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

#   # You should configure your model like this:
#   devise :omniauthable, omniauth_providers: [:weibo]

#   def weibo
#     omniauth_process
#   end

#   protected
#   def omniauth_process
#     omniauth = request.env['omniauth.auth']
#     authentication = Authentication.where(provider: omniauth.provider, uid: omniauth.uid.to_s).first

#     if authentication
#       set_flash_message(:notice, :signed_in)
#       sign_in(:user, authentication.user)
#       redirect_to root_path
#     elsif current_user
#       authentication = Authentication.create_from_hash(current_user.id, omniauth)
#       set_flash_message(:notice, :add_provider_success)
#       redirect_to authentications_path
#     else
#       session[:omniauth] = omniauth.except("extra")
#       set_flash_message(:notice, :fill_your_email)
#       redirect_to new_user_registration_url
#     end
#   end

#   def after_omniauth_failure_path_for(scope)
#     new_user_registration_path
#   end

# end






















# class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
#   def google_oauth2
#     user = User.from_google(from_google_params)

#     if user.present?
#       sign_out_all_scopes
#       flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
#       # https://accounts.google.com/o/oauth2/auth
#       &client_id='243215285456-q6o8ptkfp23m0tr5pgion4k34k744p17.apps.googleusercontent.com/'
#       &redirect_uri='http://localhost:3000/users/auth/google_oauth2/callback'
#       &scope=email profile
#       &response_type=code


#       sign_in_and_redirect user, event: :authentication
#     else
#       flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
#       redirect_to new_user_session_path
#     end
#   end

#   protected

#   def after_omniauth_failure_path_for(_scope)
#     new_user_session_paths
#   end

#   def after_sign_in_path_for(resource_or_scope)
#     stored_location_for(resource_or_scope) || root_path
#   end

#   private

#   def from_google_params
#     @from_google_params ||= {
#       uid: auth.uid,
#       email: auth.info.email,
#       full_name: auth.info.name,
#       avatar_url: auth.info.image
#     }
#   end

#   def auth
#     @auth ||= request.env['omniauth.auth']
#   end
# end
















