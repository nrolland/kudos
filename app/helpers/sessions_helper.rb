module SessionsHelper
  
  def signed_in?
    signed = !current_user.nil?
    return signed
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user  ||=user_from_remenber_token
  end
  
  def sign_in(user)
    temp = user.salt
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end
  
   def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access to this page."
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  
  def admin?
    role = current_user.role
    role == "admin"
  end
  
  def user_in_group?(group)
    current_user.group==group
  end
  
  private

    def user_from_remenber_token
     user= User.authenticate_with_salt(*remenber_token)
     return user
    end

    def remenber_token
      cookies.signed[:remember_token] || [nil,nil]
    end
    
    def store_location
      session[:return_to] = request.fullpath
    end
    
    def clear_return_to
      session[:return_to] = nil
    end
    
    
end
