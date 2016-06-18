class CodesController < ApplicationController
  before_action :set_code, only: [:show, :update, :destroy]

  # GET /codes
  def index
    if params[:tags].present?
      tags = params[:tags].split(',')
      @codetags = CodeTag.where(:tag_id => tags)
      codes = @codetags.map do |codetag|
        codetag.code_id
      end
      @codes = Code.where(:id => codes)
    elsif params[:tag_id].present?
      @codes = Tag.find(params[:tag_id]).codes
    end
    @codes = Code.all

    render json: @codes
  end

  # GET /codes/1
  def show
    render json: @code
  end

  # POST /codes
  def create
    @code = Code.new(code_params)

    if @code.save
      render json: @code, status: :created, location: @code
    else
      render json: @code.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /codes/1
  def update
    if @code.update(code_params)
      render json: @code
    else
      render json: @code.errors, status: :unprocessable_entity
    end
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
