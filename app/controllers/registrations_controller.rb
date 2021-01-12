class RegistrationsController < Devise::RegistrationsController
  
  def after_sign_up_path_for(user)
    new_user_profile_path(user_id: current_user.id)
  end
end