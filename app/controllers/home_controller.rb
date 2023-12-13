class HomeController < ApplicationController
  def show
    Rails.logger.debug("HomeController#show action executed.")
    @welcome_message = "Welcome to Lingua Franca! Start your language learning journey."
  end

end




