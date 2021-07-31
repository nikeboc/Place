class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :profile, :update]
  before_action :correct_user,   only: [:edit, :profile, :update]
  before_action :before_request,   only: [:edit, :profile]


  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Placeへようこそ!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "アカウント情報を更新しました"
      redirect_to @user
    else
      render_before_action
    end
  end

  

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # before

    # ログインユーザーが同一かどうか
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 前のactionを記憶
    def before_request
    session[:forwarding_action] = action_name
    end

    # 前ページリロード
    def render_before_action
    render session[:forwarding_action]
    session.delete(:forwarding_action)
  end
end