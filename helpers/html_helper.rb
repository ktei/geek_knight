module HtmlHelper
  def style_by_flash_key(key)
    case key
    when :success 
      'success'
    when :notice 
      'notice'
    when :error 
      'alert'
    else 
      ''
    end
  end
end