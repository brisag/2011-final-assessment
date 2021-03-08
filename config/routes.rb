Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: [:index]
  resources :surgeries, only: [:index, :show]
  resources :doctor_surgeries, only: [:create]
  end
# end

  #
  # get "/doctors", to: "surgeries#index"
  # get '/surgeries/:id', to: 'surgeries#show'
  # post '/surgeries/:id/doctors', to: 'surgery_doctors#create'
# end
