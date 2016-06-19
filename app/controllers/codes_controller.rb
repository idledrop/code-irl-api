class CodesController < ApplicationController
  before_action :set_code, only: [:show, :update, :destroy]

  # GET /codes
  def index
    if params[:tags].present? && !params[:tags].empty?

      tags = params[:tags].split(',')
      @codetags = CodeTag.where(:tag_id => tags)
      codes = @codetags.map do |codetag|
        codetag.code_id
      end
      @codes = Code.select('*, up-down AS score').where(:id => codes).order('score DESC')
    elsif params[:tag_id].present?
      @codes = Tag.find(params[:tag_id]).codes
    else
      @codes = Code.all.limit(20)
    end
    render json: @codes.as_json(
        only: [:id, :url, :up, :down, :created_at],
        include: { tags: { only: [:id, :name] } }
    )
  end

  # GET /codes/1
  def show
    render json: @code
  end

  # POST /codes
  def create
    @code = Code.new(code_params)
    @code.up = 0
    @code.down = 0
    if @code.save
      render json: @code, status: :created, location: @code
    else
      render json: @code.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /codes/1
  def update
    if code_params[:up].present?
      @code.up +=1
      @code.save
    elsif code_params[:down].present?
      @code.down +=1
      @code.save
    end

      render json: @code

  end

  # DELETE /codes/1
  def destroy
    @code.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code
      @code = Code.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def code_params
      params.require(:code).permit(:url, :up, :down)
    end
end