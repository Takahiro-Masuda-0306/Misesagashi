class FavoritesController < ApplicationController
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    current_user.approve(restaurant)
    flash[:success] = 'お気に入りに追加しました'
    redirect_to approvings_user_path(current_user)
  end

  def destroy
    restaurant = Restaurant.find(params[:restaurant_id])
    current_user.unapprove(restaurant)
    flash[:danger] = 'お気に入りから削除しました'
    redirect_to approvings_user_url(current_user)
  end
  
end
