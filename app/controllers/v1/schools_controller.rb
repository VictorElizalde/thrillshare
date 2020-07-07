class V1::SchoolsController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :set_school, only: [:update, :destroy]

  def index
    @schools = School.all
  end

  def create
    @school = School.new(school_params)

    if @school.save
      render json: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  def update
    if @school.update(school_params)
      render json: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @school.destroy
  end

  private

  def school_params
    params.require(:school).permit(:name, :address)
  end

  def set_school
    @school = School.find(params[:id])
  end
end
