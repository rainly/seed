module RenderingHelper
  
  def seed_render_all(collection, container="seed-resources")
    render :partial => "layouts/resource/container", :locals => {:collection => collection, :container => container}
  end
  
  def seed_user_bar(container="seed-user-bar")
    render :partial => "layouts/shared/user_bar", :locals => {:container => container}
  end
  
  def seed_primary_menu(orientation="vertical", container="vertical-menu")
    container = "horizontal-menu" if orientation == "horizontal"
    render :partial => "layouts/shared/menu_container", 
           :locals => {:orientation => orientation, 
                       :container => container,
                       :sortable_id => "menupages",
                       :type => "primary",
                       :collection => @primary_pages}
  end
  
  def seed_secondary_menu(orientation="vertical", container="vertical-menu")
    container = "horizontal-menu" if orientation == "horizontal"
    render :partial => "layouts/shared/menu_container", 
           :locals => {:orientation => orientation, 
                       :container => container,
                       :sortable_id => "menupages2",
                       :type => "secondary",
                       :collection => @secondary_pages}
  end
  
  def seed_page_components(container="component")
    render :partial => "components/components", :locals => {:container => container}
  end
  
  def seed_admin_messages
    "#{flash_messages} #{content_tag(:div, nil, :id => 'ajax-msg')}"
  end
  
  def seed_head_elements
    render :partial => "layouts/shared/headlinks"
  end
  
  def seed_page_description(tag="p")
    content_tag(tag, @page.description) unless !@page
  end
  
  def seed_create_tags(class_name="seed-admin-tag")
    add_resource_link(params[:controller], @page, class_name) unless !@page
  end
  
  # Sets the section title from Page.title if exists, or a title() if
  # passed, else defaults to the site name.
  def seed_page_title(tag="h1")
    if @page
      content_tag(tag, @page.title)
    else
      content_tag(tag, @page_title || APP_CONFIG[:site_name])
    end
  end
  
end