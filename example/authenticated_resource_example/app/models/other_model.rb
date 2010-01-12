class OtherModel < ActiveRecord::Base
  belongs_to :account
  belongs_to :tracker_project

  #you can't just rely on belongs to, because the correct class with the correct authentication needs to be used
  def tracker_project(options = {})
    @tracker_project = nil if options[:reload]
    @tracker_project ||= self.account.tracker_projects.find(self.tracker_project_id)
  end
end
