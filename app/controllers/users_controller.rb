class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update, :approvings]
  before_action :user_existing?, only: [:show, :edit, :update]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(20)
  end
  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params_create)
    
    if @user.save
      flash[:success] = '登録に成功しました'
      redirect_to @user
    else
      flash[:danger] = '登録に失敗しました'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    unless current_user.id == @user.id 
      redirect_to root_url
    end
    
    if @user.update(user_params_edit)
      flash[:success] = '正常に更新されました'
      redirect_to @user
    else
      flash[:danger] = '更新に失敗しました'
      render :edit
    end
  end
  
  def approvings 
    @approvings = current_user.approvings.page(params[:page])
  end
  
  def reviewings
  end
  
  private
  
  def user_params_create()
    params.require(:user).permit(:name, :email, :birth, :password, :password_confirmation)
  end
  
  def user_params_edit() 
    params.require(:user).permit(:name, :email, :birth, :contents)
  end
  
  def user_existing?
    unless @user
      redirect_to root_url
    end
  end
  
end
