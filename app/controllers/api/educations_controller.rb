class Api::EducationsController < ApplicationController

  def index
    @educations = Education.all
    render "index.json.jb"
  end

end
