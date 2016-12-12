require 'csv'

namespace :import do

  desc "Importando escolas do arquivo csv"
  task escolas: :environment do
    filename = File.join Rails.root, "escolas.csv"
    contador = 0
    CSV.foreach(filename, encoding:'iso-8859-1:utf-8',  headers: true, :quote_char => "<", :col_sep => ";") do |row|
      escola = Escola.create!({mec: row[0], nome: row[1], cnpj: row[2], logradouro: row[3], endereco: row[4], numero: row[5], complemento: row[6], bairro: row[7], cep: row[8], municipio: row[9], uf: row[10], ddd: row[11], telefone1: row[12], telefone2: row[13], site: row[14]})
      puts "#{mec} - #{escola.errors.full_messages.join(",")}" if escola.errors.any?
      contador += 1 if escola.persisted?
      puts "#{contador}"
    end
    puts "Importou escolas"
  end
  
  desc "Importando livros do arquivo csv"
  task livros: :environment do
    filename = File.join Rails.root, "livros.csv"
    contador = 0
    CSV.foreach(filename, encoding:'iso-8859-1:utf-8',  headers: true, :row_sep => :auto, :quote_char => "<", :col_sep => ";") do |row|
      livro = Livro.create!({isbn: row[0], selo: row[1], edicao: row[2], volume_serie: row[3], disciplina: row[4], segmento: row[5], colecao: row[6], obra: row[7], autor: row[8]})
      puts "#{mec} - #{livro.errors.full_messages.join(",")}" if livro.errors.any?
      contador += 1 if livro.persisted?
      puts "#{contador}"
    end
    puts "Importou livros"
  end
  
  
  
  
  
  
end
