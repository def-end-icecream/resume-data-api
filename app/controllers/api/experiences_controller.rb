class Api::ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
    render 'index.json.jb'
  end

  def show
    @experience = Experience.find_by(id: params[:id])
    render 'show.json.jb'
  end
end
