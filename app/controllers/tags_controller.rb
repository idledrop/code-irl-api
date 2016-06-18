class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]

  # GET /tags
  def index
    if params[:search].present?
      @tags = Tag.where("name LIKE ?", "%#{params[:search]}%")
    else
      @tags = Tag.all
    end
    render json: @tags.limit(10)
  end

  # GET /tags/1
  def show
    render json: @tag
  end

  # POST /tags
  def create
    if params[:code_id]
      #calling it from codes
      @code = Codes.find(params[:code_id])
    end
    @tag = Tag.new(tag_params)
    @tag.types = 'tag'
    if @tag.save
      render json: @tag, status: :created, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:name, :types)
    end
end
