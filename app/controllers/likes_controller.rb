class LikesController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destroy]
  
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
      
      flash[:danger] = 'レビューの投稿に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
   @like = Like.find_by(user_id: current_user.id, restaurant_id: params[:restaurant_id])
   @like.destroy if @like
   flash[:success] = 'レビューを削除しました'
   redirect_back(fallback_location: root_path)
  end

end
