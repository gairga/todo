Rails.application.routes.draw do
#  get 'task_detail/create'

  resources :tasks
  devise_for :users
  root to: 'tasks#index'
#  resources :task_details, only: [:create, :destroy, :show]
  resources :tasks, only: [:index] do
   resources :task_details, only: [:create, :destroy, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
