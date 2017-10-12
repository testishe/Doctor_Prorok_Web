Rails.application.routes.draw do

  root 'index#index'

  devise_for :users, :skip => [:registrations],
  controllers: { sessions: 'users/sessions',
                 confirmations: 'users/confirmations',
                 passwords: 'users/passwords' }

  resources :questions, :answers, :articles, :consultations, except: [:destroy]

  get 'contacts' => 'contacts#index', as: :contacts

end
