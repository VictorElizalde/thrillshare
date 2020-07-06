class V1::SchoolsController < ApplicationController
  acts_as_token_authentication_handler_for User

  def create
    @school = School.new(school_params)

    if @school.save
      render json: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  def index
    @schools = School.all
  end

  private

  def school_params
    params.require(:school).permit(:name, :address)
  end
end
