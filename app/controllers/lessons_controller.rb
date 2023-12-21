class LessonsController < ApplicationController
    before_action :set_language
    before_action :set_lesson, only: [:show, :edit, :update, :destroy]

    def index
      @lessons = @language.lessons
    end
  
    def show
    end
  
    def new
      @language = Language.find(params[:language_id])
      @lesson = @language.lessons.build
    end
  
    def create
      @lesson = @language.lessons.build(lesson_params)
      


      if @lesson.save
        redirect_to home_show_path
      else
        puts @lesson.errors.full_messages
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end

    def update
      # @lesson = Lesson.find(params[:id])
      if @lesson.update(lesson_params)
        redirect_to language_lessons_path(@language, @lesson), notice: 'Lesson was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @lesson.destroy
      redirect_to language_lessons_path(@language), status: :see_other
    end

  
    def purchase
      @language = Language.find(params[:language_id])
      @lesson = Lesson.find(params[:id])
    
      # Access the price from the form
      price_in_cents = params[:lesson][:price].to_i * 100  # Convert price to cents, adjust as needed
    
      # Charge the user using Stripe with the dynamic price
      charge = Stripe::Charge.create({
        amount: price_in_cents,
        currency: 'usd',
        source: params[:stripe_token],
        description: 'Lesson purchase'
      })
    
      current_user.lessons << @lesson
      flash[:success] = 'Thank you for your purchase!'
      redirect_to root_path
    rescue Stripe::CardError => e
      flash[:error] = e.message
      render :new
    end
    
    
  
    private
  
    def set_language
      @language = Language.find(params[:language_id])
    end
  
    def set_lesson
      @lesson = @language.lessons.find(params[:id])
    end
  
    def lesson_params
      params.require(:lesson).permit(:title, :body, :language_id, :user_id, :price)
    end

    def charge_params
      params.permit(:amount, :stripe_token, other_params_here)
    end
  end
  