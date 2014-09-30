require 'rubygems'
require 'sinatra'
require 'omniauth-github'
require 'httparty'
require 'rest_client'
require 'thin'
require 'json'

#setup
configure do
  set :server, 'thin'
  enable :sessions
  set :session_secret, "My session secret"
  use OmniAuth::Builder do
    #I know this bad form but I haven't deployed yet. So Shhhhhhhh
    provider :github, '5394720ddae7b4107128', 'e756c8c818b165c5dec5a5a2f88982e0493bd905'
  end
end

#Working Thread

response = HTTParty.get("https://api.github.com/repos/honeycodedbear/gitter/compare/aa5a8bd2c5f5b648ab84344ee3fe90457a3dbb25...b8262a36c765127924b5c424005a695fde02298c?client_id=5394720ddae7b4107128&client_secret=e756c8c818b165c5dec5a5a2f88982e0493bd905", headers: {"User-Agent" => 'Git Twit'})
json = JSON.parse(response.body)
json["files"].each do |sha|
  puts sha
  puts ""
end

#thr = Thread.new do
#  while true do
#    response = HTTParty.get("https://api.github.com/repos/honeycodedbear/gitter/compare/aa5a8bd2c5f5b648ab84344ee3fe90457a3dbb25...b8262a36c765127924b5c424005a695fde02298c?client_id=5394720ddae7b4107128&client_secret=e756c8c818b165c5dec5a5a2f88982e0493bd905", headers: {"User-Agent" => 'Git Twit'})
#    json = JSON.parse(response.body)
#    puts response
#  end
#end

#With curl "https://api.github.com/repos/honeycodedbear/gitter/compare/aa5a8bd2c5f5b648ab84344ee3fe90457a3dbb25...b8262a36c765127924b5c424005a695fde02298c?client_id=5394720ddae7b4107128&client_secret=e756c8c818b165c5dec5a5a2f88982e0493bd905"
#We can see the responding json. The values we are interested in is filename(we want to get the extension)
#And then Additions
