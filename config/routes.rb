Rails.application.routes.draw do
  resources :contacts do
    collection { post :csv_upload }
  end
  root 'contacts#index'
end
