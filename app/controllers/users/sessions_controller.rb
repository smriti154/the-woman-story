class Users::SessionsController < Devise::SessionsController
before_filter :configure_sign_in_params, only: [:create]
skip_filter :verify_signed_out_user, only: :destroy
prepend_before_filter :require_no_authentication, :only => [ :new, :create ]


  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
    # self.resource = warden.authenticate!(auth_options)
    # redirect_to index_url(subdomain: request.subdomain)
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :email
  end
end
