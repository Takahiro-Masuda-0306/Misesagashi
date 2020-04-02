class LikesController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :new, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  before_action :review_existing?, only: [:show, :destroy]
  
  def show
    @review = Like.find(params[:id])
  end
  
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @like = Like.new
  end
  
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    
    @review = Like.new(
    restaurant_id: params[:restaurant_id],
    user_id: current_user.id,
    review_name: current_user.name,
    restaurant_name: @restaurant.rest_name,
    review_title: params[:like][:review_title],
    review_contents: params[:like][:review_contents],
    score: params[:like][:score],
    review_image: params[:like][:review_image]
    )
    
    if @review.save
      flash[:success] = 'レビューの投稿に成功しました'
      redirect_to reviewings_user_path(current_user)
    else
      @like = Like.new
      flash[:danger] = 'レビューの投稿に失敗しました'
      render :new
    end
  end
  
  def destroy
   @like = Like.find(params[:id])
   @like.destroy if @like
   flash[:success] = 'レビューを削除しました'
   redirect_to reviewings_user_path(current_user)
  end
  
  private
  
  def correct_user
    review = Like.find(params[:id])
    user = User.find_by(id: review.user_id)
    unless current_user == user
      redirect_to root_url
    end
  end
  
  def review_existing? 
    review = Like.find_by(id: params[:id])
    unless review
      flash[:danger] = '存在しないレビューです'
      redirect_to root_url
    end
  end

end
