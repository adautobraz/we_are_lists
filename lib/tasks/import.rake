require 'csv'

namespace :import do

  desc "Importando escolas do arquivo csv"
  task escolas: :environment do
    filename = File.join Rails.root, "escolas.csv"
    contador = 0
    CSV.foreach(filename, encoding:'iso-8859-1:utf-8',  headers: true, :quote_char => "<", :col_sep => ";") do |row|
      row2=[]
      for i in 0..14
        if row[i].to_s.encoding.to_s.eql? "US-ASCII"
          row2[i] = row[i].to_s.encode("US-ASCII").force_encoding("utf-8")
        else
          row2[i] = row[i]
        end
      end
      endereco = row2[3] + row2[4] + ", " + row2[5] + ", " + row2[]
      escola = Escola.create!({mec: row2[0], nome: row2[1], cnpj: row2[2], logradouro: row2[3], endereco: endereco, numero: row2[5], complemento: row2[6], bairro: row2[7], cep: row2[8], municipio: row2[9], uf: row2[10], ddd: row2[11], telefone1: row2[12], telefone2: row2[13], site: row2[14]})
      puts "#{mec} - #{escola.errors.full_messages.join(",")}" if escola.errors.any?
      contador += 1 if escola.persisted?
      puts "#{contador}"
    end
    puts "Importou escolas"
  end
  
  desc "Importando livros do arquivo csv"
  task livros: :environment do
    filename = File.join Rails.root, "livros4.csv"
    contador = 0
    CSV.foreach(filename, encoding: "UTF-8",  headers: true, :row_sep => :auto, :quote_char => "<", :col_sep => "\t") do |row|
      row2=[]
      for i in 0..8
        if row[i].to_s.encoding.to_s.eql? "US-ASCII"
          row2[i] = row[i].to_s.encode("US-ASCII").force_encoding("utf-8")
        else
          row2[i] = row[i]
        end
      end
      livro = Livro.create!({isbn: row2[0], selo: row2[1], edicao: row2[2], volume_serie: row2[3], disciplina: row2[4], segmento: row2[5], colecao: row2[6], obra: row2[7], autor: row2[8]})
      puts "#{mec} - #{livro.errors.full_messages.join(",")}" if livro.errors.any?
      contador += 1 if livro.persisted?
      puts "#{contador}"
    end
    puts "Importou livros"
  end
  
  
  
  
  
  
end
