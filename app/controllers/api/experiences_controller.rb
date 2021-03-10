class Api::ExperiencesController < ApplicationController

  before_action :authenticate_student, except: [:show, :index]

  def index
    @experiences = Experience.all
    render 'index.json.jb'
  end

  def show
    @experience = Experience.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @experience = Experience.new(
      student_id: current_student.id,
      start_date: params[:start_date],
      end_date: params[:end_date],
      job_title: params[:job_title],
      company_name: params[:company_name],
      details: params[:details]
    )
    if @experience.save
      render 'show.json.jb'
    else
      render json: { errors: @experience.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @experience = Experience.find_by(id: params[:id])
    if current_student.id == @experience.student_id
      @experience.start_date = params[:start_date] || @experience.start_date
      @experience.end_date = params[:end_date] || @experience.end_date
      @experience.job_title = params[:job_title] || @experience.job_title
      @experience.company_name = params[:company_name] || @experience.company_name
      @experience.details = params[:details] || @experience.details
      if @experience.save
        render 'show.json.jb'
      else
        render json: { errors: @experience.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    @experience = Experience.find_by(id: params[:id])
    if current_student.id == @experience.student_id
      @experience.destroy
      render json: { message: "Experience successfully deleted!" }
    else
      render json: {}, status: :unauthorized
    end
  end

end