class Account < ActiveRecord::Base
  has_one_authenticated_resource :tracker_projects, :headers => { 'X-TrackerToken' => :tracker_token }
  has_one_authenticated_resource :tracker_stories,  :headers => { 'X-TrackerToken' => :tracker_token }
  
  #####
  # Other valid things to set are :user, :password, and :site
  # For example, in the following :tempo_user and :tempo_password would be database columns, and :highrise_site
  # refers to the method defined below
  #
  # has_one_authenticated_resource :tempo_projects, :user => :tempo_user, :password => :tempo_password
  # has_one_authenticated_resource :highrise_emails, :site => :highrise_site
  #
  # def highrise_site
  #  "http://#{self.highrise_token}.highrisehq.com/"
  # end
  ####
  
end
