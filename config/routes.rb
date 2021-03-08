Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    #student sign up and login
    post "/students" => "students#create"
    post "/sessions" => "sessions#create"

    get "/students" => "students#index"
    get "students/:id" => "students#show"
    patch "students/:id" => "students#update"
    delete "students/:id" => "students#destroy"
    
    get "/educations" => "educations#index"
    get "/educations/:id" => "educations#show"
    post "/educations" => "educations#create"
    patch "/educations/:id" => "educations#update"
    delete "/educations/:id" => "educations#destroy"

    get "skills" => "skills#index"
    get "/skills/:id" => "skills#show"

    get "/experiences" => "experiences#index"
    get "/experiences/:id" => "experiences#show"
    post "/experiences" => "experiences#create"

  end
end