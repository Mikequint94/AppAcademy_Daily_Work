module ApplicationHelper
  def auth_token
    input_tag = <<-HTML
      <input type="hidden"
             name="authenticity_token"
             value=#{form_authenticity_token}>
    HTML

    input_tag.html_safe
  end
end
