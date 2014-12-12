class RegistrationsController < Devise::RegistrationsController
  USER_METADATA_FIELDS = [
    :email_visible, :website_url, :github_url, :linkedin_url, :current_job,
    :twitter_handle, :image_url, :bio, :avatar, :avatar_cache, :remove_avatar,
    :remote_avatar_url
  ]

  def create
    if verify_recaptcha
      super
    else
      build_resource(sign_up_params)
      clean_up_passwords(resource)
      flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."
      flash.delete :recaptcha_error
      render :new
    end
  end

  private

  def sign_up_params
    arr = [:first_name, :last_name, :email, :password, :password_confirmation]
    params.require(:user).permit(arr + USER_METADATA_FIELDS)
  end

  def account_update_params
    arr = [:first_name, :last_name, :email, :password, :password_confirmation, :current_password]
    params.require(:user).permit(arr + USER_METADATA_FIELDS)
  end
end
