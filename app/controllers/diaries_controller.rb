# frozen_string_literal: true

class DiariesController < ApplicationController
  
  before_action :load_entities

  def new
    @diary = Diary.new
  end
  
  def create
    @diary = Diary.new permitted_parameters
    if @room.save
      flash[:success] = "Diary #{@diary.name} was created successfully"
      redirect_to diaries_path
    else
      render :new
    end
  end

  def edit
  end
    
  def update
    if @diary.update_attributes(permitted_parameters)
      flash[:success] = "diary #{@diary.name} was updated successfully"
      redirect_to diaries_path
    else
      render :new
    end
  end
  
  protected
    
  def load_entities
    @diaries = Diary.all
    @room = Diary.find(params[:id]) if params[:id]
  end
    
  def permitted_parameters
    params.require(:diary).permit(:name, :surname, :class)
  end
end
