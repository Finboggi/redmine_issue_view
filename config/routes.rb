# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get '/issues/:issue_id/views', to: 'issue_view#index', as: 'issue_views_list'
delete '/issue_views/wipe', to: 'issue_view#wipe'
