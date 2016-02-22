require "sinatra/reloader" if development?
require "sass/plugin/rack"

Sass::Plugin.options[:style] = :compact
use Sass::Plugin::Rack

register Sinatra::AssetPack
assets do 
  js :application, [
    '/js/app.js'
  ]
  css :application, [
    '/bower_components/pure/pure-min.css',
    '/stylesheets/style.css'
  ]
  js_compression :jsmin 
  css_compression :simple
end

APP_ROOT = Pathname.new(File.expand_path('../../',__FILE__))
APP_Name = APP_ROOT.basename.to_s

configure do
  set :views,File.join(APP_ROOT,"app","views")
end

["models", "controllers","helpers"].each do |folder|
  Dir[APP_ROOT.join("app",folder,"*.rb")].each { |file| require file }
end
