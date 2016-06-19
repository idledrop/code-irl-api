class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  # GET /comments
  def index
    code = Code.find(params[:code_id])
    @comments = code.comments

    render json: @comments
  end

  # POST /comments
  def create
    code = Code.find(params[:code_id])
    @comment = code.comments.new(name: params[:name], comment: params[:comment])

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /codes/:code_id/comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      # params.require(:comment).permit(:name, :comment)
    end
end
