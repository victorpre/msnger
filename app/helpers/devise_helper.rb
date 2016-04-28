module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    error_class = resource.class.to_s.downcase
    fields_errors = []
    resource.errors.messages.each_key {|key|
      if (key.to_s!="base")
        fields_errors << key.to_s
      end
    }
    
    fix_id = error_class+"_"+
    messages = resource.errors.full_messages.map { |msg| content_tag(:span, msg) }.uniq.join(', ')
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)
    
    binding.pry
    # Builds toast messages with 10 delay to disappear
    html = "
      <div id=\"error_explanation\">\n
        <script>
    "
    messages.split(",").reverse.each{|msg|
      html<< "Materialize.toast('#{msg}', 10000)"+ "\n"
    }
    html << "</script>\n</div>"
    
    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end
end