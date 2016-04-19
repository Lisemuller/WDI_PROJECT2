require "sinatra/reloader" if development?
require "sass/plugin/rack"

Sass::Plugin.options[:style] = :compact
use Sass::Plugin::Rack

register Sinatra::AssetPack
assets do 
  js :application, [
    '/bower_components/jquery/dist/jquery.min.js',
    '/bower_components/select2/dist/js/select2.full.min.js',
    '/js/jquery.js',
    '/js/app.js'
  ]
  css :application, [
    '/bower_components/pure/pure-min.css',
    '/bower_components/select2/dist/css/select2.min.css',
    '/stylesheets/style.css'
  ]
  js_compression :jsmin 
  css_compression :simple
end

APP_ROOT = Pathname.new(File.expand_path('../../',__FILE__))
APP_Name = APP_ROOT.basename.to_s

configure do 
  enable :sessions
  set :sessions_secret, ENV['SESSION_SECRET'] || "this is a secret, shhhhhhh"
  set :views, File.join(APP_ROOT, "app", "views")
end

["models", "controllers", "helpers"].each do |folder|
  Dir[APP_ROOT.join("app", folder, "*.rb")].each { |file| require file }
end

CarrierWave.configure do |config|

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY'],
    aws_secret_access_key: ENV['AWS_SECRET_KEY'],
    region: 'eu-west-1'
  }

  if development?
    config.storage = :file
    config.enable_processing = true
    config.root = "#{APP_ROOT}/public/"
  else
    config.storage = :fog
    config.fog_directory = ENV['AWS_BUCKET_NAME']
  end
end
