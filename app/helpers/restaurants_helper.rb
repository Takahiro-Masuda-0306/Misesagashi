module RestaurantsHelper
  def count_approved(restaurant)
    @count_approved = restaurant.approved.count
  end
  
  def count_reviewers(restaurant)
    @count_reviewers = restaurant.reviewers.count
  end
end
