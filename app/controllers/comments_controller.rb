class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    commentable = commentable_type.constantize.find(commentable_id)
    @comment = Comment.build_from(commentable, current_user.id, body)
    @post = Post.find(post_id)
    @new_comment = Comment.build_from(@post, current_user.id, "") # recreate new_comment on refresh partial (AJAX)
    respond_to do |format|
      if @comment.save
        make_child_comment
        format.js
      end
    end
  end

  def upvote
    # Get the comment id from the URL params
    @comment = Comment.find(params[:comment_id])
    @user = current_user
    if @user.present?
      if !(@user.voted_for? @comment)
        @comment.liked_by current_user
      else
        @comment.unliked_by current_user
      end
      respond_to do |format|
        # add in upvote value to json
        @comment_json = JSON::parse(@comment.to_json).merge({upvote: @comment.votes_for.size})
        # post json to page let EventHandler handle
        format.js { render json: @comment_json, content_type: 'application/json' }
      end
    else
      puts "\n\n\n\n"
      puts "Not logged in."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id, :post_id)
  end

  def commentable_type
    comment_params[:commentable_type]
  end

  def commentable_id
    comment_params[:commentable_id]
  end

  def comment_id
    comment_params[:comment_id]
  end

  def post_id
    comment_params[:post_id]
  end

  def body
    comment_params[:body]
  end

  def make_child_comment
    return "" if comment_id.blank?

    parent_comment = Comment.find comment_id
    @comment.move_to_child_of(parent_comment)
  end

end
