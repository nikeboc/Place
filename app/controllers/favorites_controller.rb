class FavoritesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :index]

  def create
    @favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  def index
    @posts = current_user.favorited_posts
    @user = current_user
  end
end

