# frozen_string_literal: true

class WeeksController < ApplicationController
  # frozen_string_literal: true

  def index
    week = Week.all
    render json: week
  end

  def create
    week = Week.create!(week_params)
    if week
      render json: week
    else
      render json: week.errors
    end
  end

  def show
    if week
      render json: week
    else
      render json: week.errors
    end
  end

  def destroy
    week&.destroy
    render json: { message: 'week deleted!' }
  end

  private

  def week_params
    params.permit(:name, :surname, :high_school_class)
  end

  def day
    @week ||= Week.find(params[:id])
  end
end

