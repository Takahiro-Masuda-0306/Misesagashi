module RestaurantsHelper
  def count_approved(restaurant)
    @count_approved = restaurant.approved.count
  end
  
  def count_reviewers(restaurant)
    @count_reviewers = restaurant.reviewers.count
  end
  
  def rest_url(review)
    review = Like.find_by(id: review.id)
    restaurant = Restaurant.find_by(id: review.restaurant_id)
    @restaurant_url = restaurant.rest_url
  end
end
