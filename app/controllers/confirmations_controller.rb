class ConfirmationsController < Devise::ConfirmationsController
  private

  protected def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    meals_path
  end
end