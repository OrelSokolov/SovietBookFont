# coding: utf-8

require "erb"
require 'base64'

font_italic64 = Base64.strict_encode64(File.open("fonts/SovietItalic.woff", "rb"){|f| f.read}).strip
font_regular64 = Base64.strict_encode64(File.open("fonts/Soviet.woff", "rb"){|f| f.read}).strip

template =  ERB.new <<-EOF

@font-face {
    font-family: 'SovietBook';
    src: url("data:application/x-font-woff;charset=utf-8;base64,<%= font_regular64 %>")  format('woff');
}

@font-face {
    font-family: 'SovietBook';
    src: url("data:application/x-font-woff;charset=utf-8;base64,<%= font_italic64 %>")  format('woff');
    font-style: italic;
}

EOF

File.open("SovietBookFont.css", "w") do |f|
    f.write template.result(binding)
end

