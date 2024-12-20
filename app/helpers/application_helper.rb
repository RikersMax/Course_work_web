module ApplicationHelper

  def title_page(name_title = '')
    base_name = 'WEB'

    if name_title.present?
      base_name = base_name + " | #{name_title}"
    else
      base_name
    end
  end

  def render_navbar
    render(partial: 'shared/navbar')
  end 

end
