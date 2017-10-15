Rails.application.routes.draw do

  root 'index#index'

  #Show questions by category
  get 'questions/archive' => 'questions#get_archive_questions', as: :get_archive_questions
  get 'questions/general' => 'questions#get_general_questions', as: :get_general_questions
  get 'questions/surgery' => 'questions#get_surgery_questions', as: :get_surgery_questions


  #Show consultations by category
  get 'consultations/archive' => 'consultations#get_archive_consultations', as: :get_archive_consultations
  get 'consultations/general' => 'consultations#get_general_consultations', as: :get_general_consultations
  get 'consultations/surgery' => 'consultations#get_surgery_consultations', as: :get_surgery_consultations

  #Show consultations by category
  get 'consultations/important' => 'consultations#get_important_consultations', as: :get_important_consultations
  get 'consultations/normal'    => 'consultations#get_normal_consultations',    as: :get_normal_consultations

  devise_for :users, :skip => [:registrations],
  controllers: { sessions: 'users/sessions',
                 confirmations: 'users/confirmations',
                 passwords: 'users/passwords' }

  resources :answers, :articles, except: [:destroy]
  resources :questions, :consultations, except: [:destroy, :edit]

  get 'contacts' => 'contacts#index', as: :contacts

  put 'question/:id/activate_deactivate' => 'questions#activate_deactivate_question', as: :activate_deactivate

  put 'consultation/:id/activate_deactivate' => 'consultations#activate_deactivate_consultation', as: :activate_deactivate_consultation

end
