Rails.application.routes.draw do
  get 'secions/new'
  get 'secions/create'
  get 'secion/new'
  get 'secion/create'
  get 'new/create'
  root to: "projects#index"

  resources :projects do
    resources :tasks
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
