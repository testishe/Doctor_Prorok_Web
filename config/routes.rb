Rails.application.routes.draw do

  root 'index#index'

  devise_for :users, :skip => [:registrations],
  controllers: { sessions: 'users/sessions',
                 confirmations: 'users/confirmations',
                 passwords: 'users/passwords' }

  resources :answers, :articles, except: [:destroy]
  resources :questions, :consultations, except: [:destroy, :edit]

  get 'contacts' => 'contacts#index', as: :contacts

end
