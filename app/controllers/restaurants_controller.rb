class RestaurantsController < ApplicationController
    before_action :authenticate_user!, only: [:upvote, :downvote] 
    before_action :authenticate_user!, except: [:index, :show] 
    before_action :set_restaurant, only: [:show, :upvote, :downvote]

   
  

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
    @vote = VoteHistory.all
    if params[:search]
      @restaurants = Restaurant.search(params[:search])
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = current_user.restaurants.build
    @vote = VoteHistory.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = current_user.restaurants.build(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def upvote
    @vote = VoteHistory.new
    @vote.restaurant_id = @restaurant.id
    @vote.upvote = true
    @vote.user_id = current_user.id
    @vote.save!
    redirect_back(fallback_location: restaurants_path)
  
  end

  
  def downvote
    @vote = VoteHistory.new
    @vote.restaurant_id = @restaurant.id
    @vote.upvote = false
    @vote.user_id = current_user.id
    @vote.save!
    redirect_back(fallback_location: restaurants_path)
  
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :location, :up_vote, :down_vote)
    end
    def upvote_params
      params.require(:id)
    end
    def downvote_params
      params.require(:id)
    end
end
