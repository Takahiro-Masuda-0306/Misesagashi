class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    current_user.approve(restaurant)
    flash[:success] = 'お気に入りに追加しました'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    restaurant = Restaurant.find(params[:restaurant_id])
    favorites = Favorite.where(restaurant_id: restaurant.id)
    
    favorites.each do |favorite|
      @user = User.find_by(id: favorite.user_id)
    end
    
    if current_user == @user  
      current_user.unapprove(restaurant)
      flash[:danger] = 'お気に入りから削除しました'
      redirect_to approvings_user_path(current_user)
    else
      flash[:danger] = '不正なアクセスです'
      redirect_to root_url
    end
  end
  
end
