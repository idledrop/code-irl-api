class FocusesController < ApplicationController
  before_action :set_focus, only: [:show, :update, :destroy]

  # GET /focuses
  def index
    @focuses = Focus.all

    render json: @focuses
  end

  # GET /focuses/1
  def show
    render json: @focus
  end

  # POST /focuses
  def create
    @focus = Focus.new(focus_params)

    if @focus.save
      render json: @focus, status: :created, location: @focus
    else
      render json: @focus.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /focuses/1
  def update
    if @focus.update(focus_params)
      render json: @focus
    else
      render json: @focus.errors, status: :unprocessable_entity
    end
  end

  # DELETE /focuses/1
  def destroy
    @focus.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_focus
      @focus = Focus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def focus_params
      params.require(:focus).permit(:name, :shortname)
    end
end
