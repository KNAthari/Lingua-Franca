class LessonsController < ApplicationController
    def show
    end
  
    def new
      @lesson = Lesson.new
    end
  
    def create
      @lesson = Lesson.new(lessons_params)
      if @lesson.save
        redirect_to home_path
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def destroy
      @lesson.destroy
          
      redirect_to home_path, status: :see_other
    end
  
    private
    def set_language
        @language = Language.find(params[:language_id])
      end
    
      def set_lesson
        @lesson = Lesson.find(params[:id])
      end
    
      def article_params
        params.require(:article).permit(:title, :body, :language_id)
      end
    end
end