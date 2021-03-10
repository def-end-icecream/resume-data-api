class Api::SkillsController < ApplicationController

  before_action :authenticate_student, except: [:show, :index]

  def index
    @skills = Skill.all
    render "index.json.jb"
  end

  def show
    @skill = Skill.find(params[:id])
    render "show.json.jb"
  end

  def create
    @skill = Skill.new(
      name: params[:name],
      student_id: current_student.id
    )
    if @skill.save
      render "show.json.jb"
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    @skill = Skill.find_by(id: params[:id])
    if current_student.id == @skill.student_id
      @skill.name = params[:name] || @skill.name
      @skill.student_id = current_student.id
      if @skill.save
        render "show.json.jb"
      else
        render json: { errors: @skill.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end

  end

  def destroy
    @skill = Skill.find_by(id: params[:id])
    if current_student.id == @skill.student_id
      @skill.destroy
      render json: { message: "Skill successfully destroyed" }
    else
      render json: {}, status: :unauthorized
    end
  end

end