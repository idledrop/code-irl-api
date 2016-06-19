class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :update, :destroy]

  # GET /hangouts/:hangout_id/emails
  def index
    if params[:hangout_id].present?
      @emails = Hangout.find(params[:hangout_id]).emails
    end
    render json: @emails
  end

  # POST /hangouts/hangout_id/emails
  def create
    hangout = Hangout.find(params[:hangout_id])
    @email = hangout.add_email(params[:email][:email])
    if @email.save
      render json: hangout.emails, status: :created
    else
      render json: @email.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /emails/1
  def update
    if @email.update(email_params)
      render json: @email
    else
      render json: @email.errors, status: :unprocessable_entity
    end
  end

  # DELETE /emails/1
  def destroy
    @email.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def email_params
      params.require(:email).permit(:email, :hangout_id)
    end
end
