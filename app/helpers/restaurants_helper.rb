module RestaurantsHelper
  def count_approved(restaurant)
    @count_approved = restaurant.approved.count
  end
end
