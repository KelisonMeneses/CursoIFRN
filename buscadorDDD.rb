require 'faraday'
require 'json'

puts 'Digite um DDD:'
ddd = gets.chomp

resposta = Faraday.get("https://brasilapi.com.br/api/ddd/v1/#{ddd}")
corpo = JSON.parse(resposta.body)
puts "Status da resposta: #{resposta.status}"

case resposta.status

when 200
    puts "Estado: #{corpo['state']}"
    puts "Número de cidades: #{corpo['cities'].size}"
    puts "Cidades do #{corpo['state']}: "
    corpo['cities'].each {|cidade| print "#{cidade}, "}
when 400 || 404
    puts "DDD invalido."
when 500..599
    puts "Erro na API, tente novamente mais tarde."

end
