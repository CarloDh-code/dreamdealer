class DreamsController < ApplicationController
before_action :set_dream, only: [:show]

  def index
    @categories = Dream::CATEGORIES
    @dreams = Dream.all

    # Filtrage par recherche
    if params[:query].present?
      sql_subquery = <<~SQL
        dreams.title ILIKE :query
        OR dreams.description ILIKE :query
        OR dreams.category ILIKE :query
      SQL
      @dreams = @dreams.joins(:user).where(sql_subquery, query: "%#{params[:query]}%")
    end

    # Filtrage par catégorie
    if params[:category].present?
      @dreams = @dreams.by_category(params[:category])
    end

    # Tri
    case params[:sort]
    when 'recent'
      @dreams = @dreams.recent
    when 'best_rated'
      @dreams = @dreams.best_rated
    end
  end

  def show
    @dream = Dream.find(params[:id])
    @booking = Booking.new
    @reviews = @dream.reviews

  end

  def new
    @dream = Dream.new
    @categories = Dream::CATEGORIES
    @ages = Dream::AGES
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user = current_user
    if @dream.save
      redirect_to dream_path(@dream)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def set_dream
    @dream = Dream.find(params[:id])
  end

  def dream_params
    params.require(:dream).permit(:title, :description, :price_per_night, :category, :age_limit, :number_of_roles, photos: [])
  end

end
