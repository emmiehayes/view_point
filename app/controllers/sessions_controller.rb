class SessionsController < ApplicationController

 def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:id] = user.id
    redirect_to dashboard_path
  end
end
