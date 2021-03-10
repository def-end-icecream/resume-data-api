class Api::EducationsController < ApplicationController

  before_action :authenticate_student, except: [:show, :index]

  def index
    @educations = Education.all
    render "index.json.jb"
  end

  def create

    #education.student_id == current_student.id

    @education = Education.new(
      start_date: params[:start_date],#"2021-01-31T00:00:00.00"
      end_date: params[:end_date],
      degree: params[:degree],
      university_name: params[:university_name],
      details: params[:details],
      student_id: current_student.id
    )
    if @education.save
      render 'show.json.jb'
    else
      render json: { errors: @education.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @education = Education.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @education = Education.find_by(id: params[:id])
    
    if current_student.id == @education.student_id
      @education.start_date = params[:start_date] || @education.start_date
      @education.end_date = params[:end_date] || @education.end_date
      @education.degree = params[:degree] || @education.degree
      @education.university_name = params[:university_name] || @education.university_name
      @education.details = params[:details] || @education.details
      @education.student_id = params[:student_id] || @education.student_id
      if @education.save
        render 'show.json.jb'
      else
        render json: { errors: @education.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end  
  end

  def destroy

    @education = Education.find_by(id: params[:id])
    #will current_student.id cause an undefined method "id" error if no one is logged in,e.g. current_student does not exist thus .id method doesn't exist

    if @education.student_id == current_student.id
      @education.destroy
      render json: { message: "Education destroyed successfully!" }
    else
      render json: { errors: "Unauthorized: Invalid Student ID" }, status: :bad_request
    end
  end

end


    # student_id = params[:id]
    # @student = Student.find_by(id: student_id)

    # if @student.id == current_student.id
    #   @student.destroy
    #   render json: { message: "Student succesfully deleted!"}
    # else 
    #   render json: { errors: @student.errors.full_messages }, status: :bad_request
    # end
