class LoginController < ApplicationController
#   def login
#   end
#   def register
#   end
# end
def new
end
def index
end
# def create
#   if user = authenticate_with_google
#     cookies.signed[:user_id] = user.id
#     session[:user_id] = user.id
#     redirect_to users_path
#   else
#     redirect_to login_path, alert: 'authentication_failed'
#   end
# end
#
# def destroy
#   session[:user_id] = nil
#   redirect_to root_path
# end
#
# private
#
# def authenticate_with_google
#   if id_token = flash[:google_sign_in]['id_token']
#     user.find_or_create_by(google_id: GoogleSignIn::Identity.new(id_token).user_id, name: GoogleSignIn::Identity.new(id_token).name)
#   elsif error = flash[:google_sign_in][:error]
#     logger.error "Google authentication error: #{error}"
#     nil
#   end
# end
# end
def create
  if user = authenticate_with_google
    cookies.signed[:user_id] = user.id
    redirect_to posts_path
  else
    redirect_to login_path, alert: 'authentication_failed'
  end
end

private
def authenticate_with_google
  if id_token = flash[:google_sign_in]["id_token"]
    identity = GoogleSignIn::Identity.new(id_token)
    user = User.find_by google_id: identity.user_id
    if user.nil?
      user = { user_name: identity.name, email: identity.email_address, google_id: identity.user_id }
      user = User.create(user)
    end
    user
  elsif error = flash[:google_sign_in]["error"]
    logger.error "Google authentication error: #{error}"
    nil
  end
end
end
