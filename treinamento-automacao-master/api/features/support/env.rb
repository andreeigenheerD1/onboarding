# require 'rspec'
require 'pry'
require 'yaml'
require 'net/http'
require 'rest-client'
require 'uri'
require 'date'
require 'base64'
require 'json'

if ENV['dev']
  $ambiente = "dev"
elsif ENV['staging']
    $ambiente = "staging"
elsif ENV['hom']
  $ambiente = "hom"
elsif ENV['prod']
  $ambiente = "prod"
else
  $ambiente = "hom"
end

$report_time = Time.now.strftime("%d-%m_%H-%M")
$report_title = "Data: #{Time.now.strftime("%d/%m")}, Hora: #{Time.now.strftime("%H:%M")}"

MASSA = YAML.load_file('data/massa_teste.yml')
DATA = YAML.load_file('data/data.yml')