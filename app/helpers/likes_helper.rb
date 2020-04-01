module LikesHelper
  
  def like_finder(restaurant)
    @like = Like.find_by(user_id: current_user.id, restaurant_id: restaurant.id)
  end
  
  def rest_find(review)
    review = Like.find_by(id: review.id)
    @restaurant = Restaurant.find_by(id: review.restaurant_id)
  end
  
  def user_find(review) 
    review = Like.find_by(id: review.id)
    @user = User.find_by(id: review.user_id)
  end
  
end
