module Backoffice::ProjectsHelper
  def link_to_preview_project_cover(project)
    if project.cover.attached?
      url_for(project.cover)
    else
      ""
    end
  end
end
