class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :destroy]
  def index
    @languages = Language.all 
  end

  def show
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(languages_params)
    if @language.save
      redirect_to home_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @language.destroy
        
    redirect_to home_path, status: :see_other
  end

  private
    def set_language
      @languages = Language.find(params[:id])
    end
    def languages_params
      params.require(:language).permit(:name, :description)
    end
end
