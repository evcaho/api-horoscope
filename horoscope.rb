require 'dotenv'
Dotenv.load
require 'httparty'
require 'oauth'
require 'sinatra'

get '/' do
  random_page = HTTParty.get('https://en.wikipedia.org/w/api.php?action=query&list=random&format=json&rnnamespace=0')
  @prediction = random_page['query']['random'][0]['title']
  @id = random_page['query']['random'][0]['id']
  erb :index
end

