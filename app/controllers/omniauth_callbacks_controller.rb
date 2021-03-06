class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :user_agreed_rules?
  
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      # flash.notice = t(:sign_in_successfully)
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :facebook, :all
end
