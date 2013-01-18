class RegistrationsController < Devise::RegistrationsController
  def create
    if verify_recaptcha
      super
      session[:events] ||= Array.new
      session[:events] << { category: "user", action: "create", label: "count", value: User.count }
    else
      build_resource
      clean_up_passwords(resource)
      flash.now[:alert] = "Sila masukkan kembali kod reCaptcha."
      flash.delete :recaptcha_error
      render :new
    end
  end
end