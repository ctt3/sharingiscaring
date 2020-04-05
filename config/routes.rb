Rails.application.routes.draw do

    root 'static_pages#index'

    devise_for :users, path_names: { sign_in: :login, sign_out: :logout }, controllers: {
		sessions: 'users/sessions'
	}


end
