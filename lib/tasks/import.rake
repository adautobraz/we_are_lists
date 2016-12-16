require 'csv'

namespace :import do

  desc "Importando escolas do arquivo csv"
  task escolas: :environment do
    filename = File.join Rails.root, "escolas.csv"
    contador = 0
    CSV.foreach(filename, encoding:'UTF-8',  headers: true, :quote_char => "<", :col_sep => ";") do |row|
      row2=[]
      for i in 0..14
        if row[i].to_s.encoding.to_s.eql? "US-ASCII"
          row2[i] = row[i].to_s.encode("US-ASCII").force_encoding("utf-8")
        else
          row2[i] = row[i]
        end
      end
      endereco = row2[3] + "  " + row2[4] + ", " + row2[5]
      if(row2[6].present?)
        endereco = endereco+ ", " + row2[6]
      end
      m = row2[12].length - 5
      telefone1 = "(" + row2[11] + ") " + row2[12][0..m] + "-" + row2[12].split(//).last(4).join
      if (row2[13].present?)
        telefone2 = "(" + row2[11] + ") " + row2[13][0..m] + "-" + row2[13].split(//).last(4).join
      else
        telefone2 = ""
      end
      escola = Escola.create!({mec: row2[0], nome: row2[1], cnpj: row2[2], endereco: endereco, bairro: row2[7], cep: row2[8], municipio: row2[9], uf: row2[10], telefone1: telefone1, telefone2: telefone2, site: row2[14]})
      #puts "#{mec} - #{escola.errors.full_messages.join(",")}" if escola.errors.any?
      contador += 1 if escola.persisted?
      #puts "#{contador}"
    end
    puts "Importou escolas"
  end
  
  desc "Importando livros do arquivo csv"
  task livros: :environment do
    filename = File.join Rails.root, "livros.csv"
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
      disciplina = row2[4].split.map(&:capitalize).join(' ')
      puts(disciplina)
      livro = Livro.create!({isbn: row2[0], selo: row2[1], edicao: row2[2], volume_serie: row2[3], disciplina: disciplina, segmento: row2[5], colecao: row2[6], obra: row2[7], autor: row2[8]})
      puts "#{mec} - #{livro.errors.full_messages.join(",")}" if livro.errors.any?
      contador += 1 if livro.persisted?
      puts "#{contador}"
    end
    puts "Importou livros"
  end
  
  
  
  
  
  
end
