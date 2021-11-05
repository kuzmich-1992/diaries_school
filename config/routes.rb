Rails.application.routes.draw do
  resources :diaries do
    resources :weeks do
      resources :days
    end
  end
end
