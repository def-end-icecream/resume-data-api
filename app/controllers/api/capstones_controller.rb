class Api::CapstonesController < ApplicationController

  before_action :authenticate_student, except: [:show, :index]

  def index
    @capstones = Capstone.all
    render 'index.json.jb'
  end

  def show
    @capstone = Capstone.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @capstone = Capstone.new(
      name: params[:name],
      description: params[:description],
      url: params[:url],
      screenshot: params[:screenshot],
      student_id: current_student.id
    )
    if @capstone.save
      render 'show.json.jb'
    else
      render json: {errors: @capstone.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @capstone = Capstone.find_by(id: params[:id])
    if current_student.id == @capstone.id
      @capstone.name = params[:name] || @capstone.name
      @capstone.description = params[:description] || @capstone.description
      @capstone.url = params[:url] || @capstone.url
      @capstone.screenshot = params[:screenshot] || @capstone.screenshot
      if @capstone.save
        render 'show.json.jb'
      else
        render json: {errors: @capstone.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    @capstone = Capstone.find_by(id: params[:id])
    if current_student.id == @capstone.id
      @capstone.destroy
      render json: {message: "Capstone successfully destroyed!"}
    else
      render json: {}, status: :unauthorized
    end
  end

end