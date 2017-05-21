class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  def create
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html {redirect_to blog_path(@blog), notice: 'コメントを投稿しました。'}
        format.js {render :index}
      else
        format.html {render :new}
      end
    end
  end

  def edit
  end

  def update
      if @comment.update(comment_params)
        redirect_to blog_path(@blog)
      else
        render :edit
      end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html {redirect_to blog_path(@blog), notice: 'コメントを削除しました。'}
        format.js {render :index}
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
    @blog = @comment.blog
  end
end
