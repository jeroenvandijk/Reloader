::Rails::Application.routes.draw do |map|
  match 'javascripts/reloader/:file.js', :to => 'reloader/reloader#show', :as => "reloader", :defaults => { :format => :js }
end
