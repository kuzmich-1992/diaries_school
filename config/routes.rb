# frozen_string_literal: true

Rails.application.routes.draw do
  root controller: :diaries, action: :index
  resources :diaries do
    resources :weeks do
      resources :days
    end
  end
end
