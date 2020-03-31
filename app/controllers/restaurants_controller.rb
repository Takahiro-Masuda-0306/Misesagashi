class RestaurantsController < ApplicationController
  def index
    require 'net/http'
    @freeword = params[:search][:freeword_field].downcase
    data = {
      "keyid": "e7130fc111ffa7df69ad952842a43749",
      "freeword": @freeword,
      "hit_per_page": 50
    }
    query = data.to_query
    uri = URI.parse('https://api.gnavi.co.jp/RestSearchAPI/v3/?' + query)
    json = Net::HTTP.get(uri)
    results = JSON.parse(json)
    results_parse = results["rest"]  #rest以下は配列になっているので扱いやすいようにresults_parseに代入
    restaurants = []  #空の配列を作成してインスタンス変数に代入
    if results_parse == nil
      flash[:danger] = '検索結果が見つかりませんでした'
      render toppages_index_path
    else
      results_parse.each do |result|
        restaurants << rest_register(result)  #空の配列にrest_registerメソッドからの返り値を挿入
      end
    end
    
    @restaurants = Kaminari.paginate_array(restaurants).page(params[:page]).per(10) #restaurants配列に対してpaginationを作成
    @user = User.find_by(id: current_user.id)
  end
  
  def reviewers
    restaurant = Restaurant.find(params[:id])
    @reviewers = restaurant.reviewers.order(id: :desc).page(params[:page]).per(20)
  end
  
  private
  
  def rest_register(rest)  #restにはresults["rest"].eachのそれぞれの要素が入る
    @rest = Restaurant.find_or_create_by(rest_id: rest["id"], rest_name: rest["name"], rest_place: rest["address"], rest_phone: rest["tel"], rest_contents: rest["pr"]["pr_short"], rest_image: rest["image_url"]["shop_image1"], rest_url: rest["url"])
    return @rest  #これはインスタンスなので@rest.rest_nameでアクセス可能→Viewで@restaurants.each do |restaurant|としたらrestaurant.rest_name
  end
end
