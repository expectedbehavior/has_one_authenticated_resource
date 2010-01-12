class TrackerStory < ActiveResource::Base
  self.site = "http://www.pivotaltracker.com/services/v2/projects/:project_id"
  self.element_name = "story"
  
  def self.find_by_project_id(tracker_project_id)
    self.find(:all, :params => { :project_id => tracker_project_id })
  end
end
