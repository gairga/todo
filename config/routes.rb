Rails.application.routes.draw do

  get 'tasks/index'
  get 'task_details/topfive'
  resources :tasks
  devise_for :users
  delete 'tasks/:id/deletetask', to: 'tasks#deletetask', as: 'deletetask'

  root to: 'home#index'
#  resources :task_details, only: [:create, :destroy, :show]
  resources :tasks, only: [:index] do
   resources :task_details, only: [:create, :destroy, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
