require 'bundler'
Bundler.setup

require 'toto'

# Rack config
use Rack::Static, :urls => ['/css', '/js', '/images', '/fonts', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

# Toto config
toto = Toto::Server.new do
  set :author, 'Alexander Kern'
  set :title, 'kernpedia'
  set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
  set :ext, 'txt'
end

run toto