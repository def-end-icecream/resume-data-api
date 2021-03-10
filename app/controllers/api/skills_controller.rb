class Api::SkillsController < ApplicationController

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
      skill_name: params[:skill_name],
      student_id: params[:student_id]
    )
    if @skill.save
      render json "show.json.jb"
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    @skill = Skill.find_by(id: params[:id])
    @skill.skill_name = params[:skill_name] || @skill.skill_name
    @skill.student_id = params[:student_id] || @skill.student_id
    if @skill.save
      render json "show.json.jb"
    else
      render json: { errors: @skill.errors.full_messages }, status: :unprocessable_entity
    end

    def destroy
      @skill = Skill.find_by(id: params[:id])
      if @skill.destroy
        render json: {message: "Skill deleted"}
      else
        render json: {message: "Not authorized"}
      end
    end
  end
end
