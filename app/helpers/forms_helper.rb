module FormsHelper
  
  def initial_display_style(element)
    if @event.all_day? && element == :datetime
      "display:none;"
    elsif @event.all_day? && element == :from_date
     "display:inline"
    elsif element == :from_date
      "display:none;"
    end
  end
  
  def form_tab_link(name, submittext, resource=nil)
    link_to_function name, :class => selected?(name, resource) do |page| 
    	page.replace_html :tabbedform, :partial => partial_name(name), :locals => {:submit => submittext}
    	page.select('#formtabs li a').each do |a|
    	  a.removeClassName('selected')
    	end
    	page.select("li.#{partial_name(name)}tab a").first.addClassName('selected')
    	page.visual_effect :highlight, :changer, :startcolor => '#dae4e5', :endcolor => '#f1f4f6', :duration => 0.5
    end
  end
  
  private
  
  def selected?(name, resource)
    if !resource.nil?
      "selected" if resource == "selected" || (partial_name(name) == resource_type(resource))
    end
  end
  
  def partial_name(name)
    name.downcase.gsub(" ", "")
  end
  
  def resource_type(resource)
    if resource.has_attribute? :article_type
      resource.article_type
    elsif resource.has_attribute? :component_type
      resource.component_type 
    end
  end
  
end