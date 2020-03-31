class LikesController < ApplicationController
  
  def new
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @review = current_user.likes.new
  end
  
  def create
    @review = current_user.review(review_params)
    if @review.save
      flash[:success] = 'レビューを投稿しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'レビューの投稿に失敗しました'
      render :new
    end
  end
  
  def destroy
    restaurant = Restaurant.find_by(id: params[:id])
    current_user.unreview(restaurant)
    flash[:danger] = 'レビューを削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def review_params #ストロングパラメータの名前はカラム名と一致
    @review = params.require(:like).permit(:retaurant_id, :review_title, :review_contents, :score, :review_image)
    if @review == nil
      flash[:danger] = 'レビュー内容が不足しています'
      render :new
    else
      return @review
    end
  end

end
