class UsersController < ApplicationController
  def index
    if params[:filter] == 'recent_posts'
      @filter_link_text = 'MOST POSTS'
      @filter_link = 'post_count'
      @users = User.order_by_most_recent_post.page(params[:page]).per(21)
    else
      @filter_link_text = 'RECENT POSTINGS'
      @filter_link = 'recent_posts'
      @users = User.order_by_post_count.page(params[:page]).per(21)
    end
  end

  def follow_toggle
    # raise
    if Following.where(follower_id: current_user.id, followed_id: params[:following_id]).any?
      Following.find_by_follower_id_and_followed_id(current_user.id, params[:following_id]).destroy
      # head :ok
      redirect_back(fallback_location: root_path)
    else
      Following.create!(follower_id: current_user.id, followed_id: params[:following_id])
      # head :ok
      redirect_back(fallback_location: root_path)
    end
  end

  def username_validator
    if params[:username].size <= 2
      render json: { valid: false }
    elsif User.find_by_username(params[:username])
      render json: { valid: false }
    else
      render json: { valid: true }
    end
  end
end
