Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/pokemon" => "pokemon#index"
  end

  # Chris: Test Code!
  # Theo: Hello World
end
