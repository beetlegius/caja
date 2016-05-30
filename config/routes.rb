Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
    resources :cashs do
      resources :moves, only: [:index, :create]
    end
    resources :moves, only: [:index, :show, :update, :destroy]
  end

end
