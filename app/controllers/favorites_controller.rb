class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    current_user.approve(restaurant)
    flash[:success] = 'お気に入りに追加しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    restaurant = Restaurant.find(params[:restaurant_id])
    favorite = Favorite.find_by(restaurant_id: restaurant.id)
    user = User.find_by(id: favorite.user_id)
    
    unless current_user == user
      flash[:danger] = '存在しないお気に入りです'
      redirect_to root_url
    end
      
    current_user.unapprove(restaurant)
    flash[:danger] = 'お気に入りから削除しました'
    redirect_back(fallback_location: root_path)
  end
  
end
