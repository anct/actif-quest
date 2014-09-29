class Admins::RegistrationsController < Devise::RegistrationsController
  layout 'admin' 

  protected

    def after_update_path_for(resource)
      edit_admin_registration_path
    end
end