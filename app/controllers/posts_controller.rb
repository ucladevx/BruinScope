class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def list
    @posts = Post.all
  end

  def show
    # Get the post id from the URL params
    @post = Post.find(params[:id])
    # Respond to a remote call (AJAX) with some javascript
    respond_to do |format|
      format.html # This will invoke show.html.erb
      format.js # This will invoke show.js.erb that should be in the views/posts/ folder and will have acess to @post
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
    	format.html
		end
  end

  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
    end
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :experience, :question)
    end
end
