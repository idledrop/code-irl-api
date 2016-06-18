class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]

  # GET /tags
  def index
    if params[:code_id].present?
      @tags = Code.find_by_id(params[:code_id]).tags
    elsif params[:search].present?
      @tags = Tag.where("lower(name) LIKE ?", "%#{params[:search].downcase}%")
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
      #Were adding tags to the code.
      @code = Code.find(params[:code_id])
      tag_ids = params["tag_ids"]
      tag_ids.each do |tag_id|
        @code.tags << Tag.find_by_id(tag_id)
      end
      @code.save
        render json: @code.tags, status: :created, location: @tag
    else
      @tag = Tag.new(tag_params)
      @tag.types = 'tag'
      if @tag.save
        render json: @tag, status: :created, location: @tag
      else
        render json: @tag.errors, status: :unprocessable_entity
      end
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
    if params[:code_id].present?
      # /codes/:codeid/tags/1
      @tag = CodeTag.where({code_id: params[:code_id], tag_id: params[:id]})
    end
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
