class StaticController < ApplicationController
  def index
    @page_title = 'DailySmarty | A Tool for Learning Something New Everyday'

    if current_user
      hfs = HomepageFeedService.new(user: current_user)
      @posts = hfs.feed_query
                  .page(params[:page]).per(20)
                  .includes([:topics, :user, img_attachment: :blob])
      render 'static/feed'
    else
      # @featured_posts_with_images = Post.published.with_images.limit(10)
      # @featured_posts_with_images = Post.published.with_images.limit(10)
      @featured_posts_with_images = Post.all.limit(10).includes([:topics, :user, img_attachment: :blob])
    end    
  end

  def profile
    @user = User.friendly.find(params[:id])

    if @user == current_user
      @posts = @user.posts.page(params[:page]).per(20).includes([:topics, img_attachment: :blob])
    else
      @posts = @user.posts
                    .published.page(params[:page]).per(20)
                    .includes([:topics, img_attachment: :blob])
    end
  end

  def about
  end

  def contact
  end

  def privacy
  end
end
