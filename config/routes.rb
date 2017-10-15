Rails.application.routes.draw do

  root 'index#index'

  #Show questions by category
  get 'questions/archive' => 'questions#get_archive_questions', as: :get_archive_questions
  get 'questions/general' => 'questions#get_general_questions', as: :get_general_questions
  get 'questions/surgery' => 'questions#get_surgery_questions', as: :get_surgery_questions

  devise_for :users, :skip => [:registrations],
  controllers: { sessions: 'users/sessions',
                 confirmations: 'users/confirmations',
                 passwords: 'users/passwords' }

  resources :answers, :articles, except: [:destroy]
  resources :questions, :consultations, except: [:destroy, :edit]

  get 'contacts' => 'contacts#index', as: :contacts

  

  put 'question/:id/activate_deactivate' => 'questions#activate_deactivate_question', as: :activate_deactivate

end
