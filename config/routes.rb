Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get "blogs/featured", to: "blogs#featured_blogs"
      post 'summer-club/apply', to: 'summer_club#apply'
      post 'code-club/apply', to: 'code_club#apply'
      resources :applicants
      resources :inquiries
      resources :sessions, path: :curriculum_sessions, only: :index do
        resources :facilitator_guides, only: :show
        resources :lesson_notes, only: :show
      end
      resources :progresses, only: :index
      resources :blogs, only: [:show, :index]
    end
  end
end
