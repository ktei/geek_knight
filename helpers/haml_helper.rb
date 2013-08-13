module HamlHelper
  def js(fname, sub_folders = '')
    fname = File.extname(fname) == '.js' ? fname : "#{fname}.js"
    sub_folders = sub_folders.blank? ? "" : "#{sub_folders}/"
    capture_haml do
      haml_tag :script, :src => "/assets/js/#{sub_folders}#{fname}"
    end
  end

  def css(fname, sub_folders = '')
    fname = File.extname(fname) == '.css' ? fname : "#{fname}.css"
    sub_folders = sub_folders.blank? ? "" : "#{sub_folders}/"
    capture_haml do
      haml_tag :link, :href => "/assets/css/#{sub_folders}#{fname}", :rel => "stylesheet"
    end
  end

  def alert_box(message, type = :notice, can_close = false)
    capture_haml do
      haml_tag "div.alert-box.#{type.to_s}}", :data => { alert: '' } do
        haml_concat message
        if can_close
          haml_tag 'a.close{href: "#"}' do
            haml_concat "&times;"
          end
        end
      end
    end
  end
end