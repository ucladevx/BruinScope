class Users::RegistrationsController < Devise::RegistrationsController
	before_action :configure_sign_up_params, only: [:create]
	before_action :authenticate_user!, only: [:update]

	# PUT /resource
	def update
		@user = User.find(current_user.id)
		if @user
			updated = @user.update_attributes!(updateParams)
		end
		if updated
			set_flash_message :notice, :updated
			sign_in @user, :bypass => true
			redirect_to user_path(@user.id)
		else
			render 'edit'
		end
	end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
   end

   def updateParams
      params.require(:user).permit(:email, :avatar)
	 end
end
