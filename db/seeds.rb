# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Primeiro, precisamos de um usuário para ser o "autor" ou "responsável" por essas formações,
# pois a tabela 'events' exige um 'user_id'.
# Vamos pegar o primeiro usuário que encontrarmos no banco de dados.
user = User.first

# Se não houver nenhum usuário, o script para com uma mensagem de erro.
if user.nil?
  puts "ERRO: Nenhum usuário encontrado. Por favor, crie um usuário antes de rodar o seed."
  return
end

puts "Iniciando o seed de formações..."

# Aqui está a lista de títulos que você forneceu.
formacoes = [
  "Vida de Oração",
  "Três Pilares",
  "Estatuto",
  "Eucaristia e Confissão",
  "Batismo, Crisma e Unção",
  "Missa",
  "Matrimônio e Ordem",
  "Apologética",
  "Conduta do Cristão",
  "Outras visões de Fé"
]

# Vamos percorrer cada título e criar um Evento para ele.
formacoes.each do |titulo_da_formacao|
  # Usamos 'find_or_create_by!' para evitar criar duplicatas se você rodar este comando de novo.
  # Ele só vai criar se um evento com este título ainda não existir.
  Event.find_or_create_by!(title: titulo_da_formacao) do |event|
    event.user = user  # Associa o evento ao usuário que encontramos.
    event.event_at = Time.current # Define uma data/hora padrão. Você pode mudar se quiser.
    puts "  -> Formação '#{event.title}' criada."
  end
end

puts "\nSeed de formações concluído com sucesso!"


puts "\nIniciando o seed de participantes..."

# Lista de nomes extraída da sua lista de aniversariantes.
nomes_dos_participantes = [
  "Alex", "Alvaro", "Emily", "Gustavo", "Jario",
  "Hagda", "Hericle", "Luan", "Thiago", "Edemilton", "Anchieta"
]

Student.destroy_all
nomes_dos_participantes.each do |nome|
  # Usamos 'find_or_create_by!' para não criar duplicatas.
  # Ele só vai criar se um participante com este nome ainda não existir.
  Student.find_or_create_by!(name: nome) do |student|
    # Os campos de email e phone ficarão em branco (nil), o que é permitido.
    puts "  -> Participante '#{student.name}' criado."
  end
end

puts "\nSeed de participantes concluído com sucesso!"
