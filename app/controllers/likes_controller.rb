class LikesController < ApplicationController

  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    current_user.follow(restaurant)
    flash[:success] = 'いいね！しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    restaurant = Restaurant.find(params[:restaurant_id])
    current_user.unfollow(restaurant)
    flash[:danger] = 'いいね！を外しました'
    redirect_back(fallback_location: root_path)
  end
end
