Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  namespace :api do
    namespace :v1 do
      resources :teams do
        resources :members, controller: 'team_members'
        resources :projects, shallow: true
      end

      resources :projects, only: [] do
        resources :tasks, shallow: true
      end

      resources :tasks, only: [] do
        resources :comments, shallow: true
      end

      get 'me/tasks', to: 'tasks#assigned'
      resources :notifications, only: [:index] do
        patch 'read', on: :member
        patch 'read_all', on: :collection
      end
    end
  end
end
