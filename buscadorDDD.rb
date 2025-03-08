require 'faraday'
require 'json'

puts "Digite um DDD:"
ddd = gets.chomp

resposta = Faraday.get(https://brasilapi.com.br/api/ddd/v1/{ddd})
corpo = JSON.parse(resposta.body)