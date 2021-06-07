class PostsController < ApplicationController
  before_action :logged_in_user, only: [:show, :new, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build if logged_in?
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.image.attach(params[:post][:image])
    if @post.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_url
  end

  private

    def post_params
      params.require(:post).permit(:content, :title, :price, :location, :image)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

end
