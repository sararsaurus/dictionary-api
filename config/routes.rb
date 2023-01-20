Rails.application.routes.draw do
  get "/meanings" => "meanings#index"
  post "/meanings" => "meanings#create"
end
