Svr::Application.routes.draw do
	root :to => 'reader_logs#index'
  resources :reader_logs, :only => [:create], :path => 'ln'

  scope '~rdb' do
    resources :reader_logs, :only => [:create], :path => 'ln'
  end
end
