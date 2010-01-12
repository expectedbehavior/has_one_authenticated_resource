class TrackerProject < ActiveResource::Base
  self.site = "http://www.pivotaltracker.com/services/v2"
  self.element_name = "project"
end
