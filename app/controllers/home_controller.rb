class HomeController < ApplicationController
  def show
    Rails.logger.debug("HomeController#show action executed.")
    @welcome_message = "Welcome to Lingua Franca! Start your language learning journey."
    @language_id = params[:language_id]
  end

end




