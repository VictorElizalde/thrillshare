class V1::RecipientsController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :set_recipient, only: [:update, :destroy]

  def index
    @recipients = Recipient.all
  end

  def create
    @recipient = Recipient.new(recipient_params)
    @recipient.school = School.find(params[:school_id])

    if @recipient.save
      render json: @recipient
    else
      render json: @recipient.errors, status: :unprocessable_entity
    end
  end

  def update
    if @recipient.update(recipient_params)
      render json: @recipient
    else
      render json: @recipient.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @recipient.destroy
  end

  private

  def recipient_params
    params.require(:recipient).permit(:name, :address, :school_id)
  end

  def set_recipient
    @recipient = Recipient.find(params[:id])
  end
end
