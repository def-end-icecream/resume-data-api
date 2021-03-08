Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"


  namespace :api do
    #student sign up and login
    post "/students" => "students#create"
    post "/sessions" => "sessions#create"
  end
end
