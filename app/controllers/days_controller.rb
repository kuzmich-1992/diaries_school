class DaysController < ApplicationController
  def index
    day = Day.all.order(created_at: :desc)
    render json: day
  end

  def create
    day = Day.create!(day_params)
    if day
      render json: day
    else
      render json: day.errors
    end
  end

  def show
    if day
      render json: day
    else
      render json: day.errors
    end
  end

  def destroy
    day&.destroy
    render json: { message: 'day deleted!' }
  end

  private

  def day_params
    params.permit(:name, :surname, :high_school_class)
  end

  def day
    @day ||= Day.find(params[:id])
  end
end