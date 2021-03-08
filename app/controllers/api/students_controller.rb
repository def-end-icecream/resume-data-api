class Api::StudentsController < ApplicationController
  
  def create
    student = Student.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      # phone_number: params[:phone_number],
      # bio: params[:bio],
      # linkedin_url: params[:linkedin_url],
      # twitter_handle: params[:twitter_handle],
      # personal_website_url: params[:personal_website_url],
      # resume_url: params[:resume_url],
      # github_url: params[:github_url],
      # image_url: params[:image_url],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if student.save
      render json: { message: "Student created successfully" }, status: :created
    else
      render json: { errors: student.errors.full_messages }, status: :bad_request
    end
  end

  def index
    @students = Student.all
    render "index.json.jb"
  end

  def show
    student_id = params[:id]
    @student = Student.find_by(id: student_id)
    render "show.json.jb"
  end

  def update
    student_id = params[:id]
    @student = Student.find_by(id: student_id)

    if @student.id == current_student.id
      if params[:password]
        @student.password = params[:password]
        @student.password_confirmation = password_confirmation
      end

      @student.first_name = params[:first_name] || @student.first_name
      @student.last_name = params[:last_name] || @student.last_name
      @student.email = params[:email] || @student.email
      @student.phone_number = params[:phone_number] || @student.phone_number
      @student.short_bio = params[:short_bio] || @student.short_bio
      @student.linkedin_url = params[:linkedin_url] || @student.linkedin_url
      @student.twitter_handle = params[:twitter_handle] || @student.twitter_handle
      @student.personal_website_url = params[:personal_website_url] || @student.personal_website_url
      @student.resume_url = params[:resume_url] || @student.resume_url
      @student.github_url = params[:github_url] || @student.github_url
      @student.image_url = params[:image_url] || @student.image_url
    end
    
  end
end
