class Users::RegistrationsController < Devise::RegistrationsController
  before_action :two_users_registered?, only: [:new, :create]

  protected
  def two_users_registered?
    if ((User.count == 2) & (user_signed_in?))
      redirect_to root_path
    elsif User.count == 2
      redirect_to admin_path
    end
  end

end
