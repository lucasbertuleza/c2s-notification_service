Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api, path: nil, as: nil, defaults: { format: :json } do
    namespace :v1 do
      post "/", to: "notifications#create"
    end
  end
end
