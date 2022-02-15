Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resource :session, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create]
    resources :questions, only: [:index, :new, :edit, :create, :update, :destroy, :show]
    resources :questions do 
      resources :answers, only: [:create, :destroy, :update, :edit] 
    end
    root 'pages#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
  end
end
