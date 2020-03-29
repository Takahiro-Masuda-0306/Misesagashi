module RestaurantsHelper
  def count_approved(restaurant)
    @count_approved = restaurant.approved.count
  end
  
  def count_followers(restaurant)
    @count_followers = restaurant.followers.count
  end
end
