class Backoffice::SessionsController < BackofficeController
  skip_before_action :authenticate

  def new
    redirect_to admin_path if logged_in?
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_path    
    else
      flash.alert = "E-mail ou Senha incorretos."
      redirect_to new_backoffice_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_backoffice_session_path
  end
end
