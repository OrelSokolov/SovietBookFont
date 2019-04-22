require "erb"
require 'base64'

font_italic64 = Base64.strict_encode64(File.read("fonts/SovietItalic.woff")).strip
font_regular64 = Base64.strict_encode64(File.read("fonts/Soviet.woff")).strip

template =  ERB.new <<-EOF

@font-face {
    font-family: 'SovietBook';
    src: url("data:application/x-font-woff;charset=utf-8;base64,<%= font_regular64 %>");
}

@font-face {
    font-family: 'SovietBook';
    src: url("data:application/x-font-woff;charset=utf-8;base64,<%= font_italic64 %>");
    font-style: italic;
}

EOF

File.open("SovietBookFont.css", "w") do |f|
    f.write template.result(binding)
end

