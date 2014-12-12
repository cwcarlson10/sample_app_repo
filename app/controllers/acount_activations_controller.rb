class AcountActivationsController < ApplicationController
	def edit
    user = User.find_by(email: params[:email])
    if user && !user.is_activated? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:is_activated,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
