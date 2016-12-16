# encoding: utf-8

class ListsController < ApplicationController
    def new
        @escola = Escola.find(params[:escola_id])
        @list = List.new
        @ef1 = ["1º ano", "2º ano", "3º ano","4º ano", "5º ano"]
        @ef2 = ["6º ano", "7º ano", "8º ano","9º ano"]
        @em = ["1º ano", "2º ano", "3º ano"]
        @ei = ["Pré 1", "Pré 2", "Pré3"]
    end
    
    def create
        @escola = Escola.find(list_params[:escola_id])
        @list = List.new(list_params)

        if @list.save
            flash[:notice] = "Lista adicionada com sucesso"
            redirect_to escola_list_path(@escola, @list)
        else
            flash[:notice] = "Preencha todos os campos obrigatórios"
            redirect_to new_escola_list_path(escola_id: @escola.id)
        end
    end
    
    def delete
        @livro = Livro.find(params[:livro_id])
        @list = List.find(params[:list_id])
        @escola = @list.escola
        @list.livros.delete(@livro)
        redirect_to escola_list_path(@list.escola, @list)
    end
    
    def show
        @list = List.find(params[:id])
        @escola = @list.escola
        #@disciplinas = Livro.where(:segmento => @list.segmento).uniq.pluck(:disciplina);
        #@disciplinas = Livro.where(:segmento => List.find(2).segmento).uniq.pluck(:disciplina)
        respond_to do |format| 
            format.html
            format.pdf do
              render :pdf => "lista.pdf",
                     :template => "lists/pdf.html.erb",
                     :layout => 'list_pdf'
            end
        end
    end
   
    def update
        @list = List.find(params[:id])
        @escola = @list.escola
        #@disciplinas = Livro.where(:segmento => List.find(2).segmento).uniq.pluck(:disciplina)
        @livro = Livro.find_by(:obra => obra_data[:obra])
        if @livro.nil?
            @livro = Livro.find_by(:obra => obra_data[:isbn])
            if @livro.nil?
                flash[:notice] = "Livro não está na base dados"
                redirect_to edit_list_path(@list)
            else
                @list.livros << @livro
                redirect_to escola_list_path(@escola, @list)
            end
        else
            @list.livros << @livro
            redirect_to escola_list_path(@escola, @list)
        end
    end
    
    def destroy
        @list = List.find(params[:id])
        @escola = Escola.find(@list.escola_id)
        @list.delete
        redirect_to escola_path(@escola)
    end
    
    
    
    def edit
        @list = List.find(params[:id])
        #@disciplinas = Livro.where(:segmento => List.find(2).segmento).uniq.pluck(:disciplina)
        @livros = Livro.where(segmento:[@list.segmento, 'Informativo Juvenil', 'Informativo Infantil', 'Literatura Infantil', 'Literatura Juvenil', 'Atlas/Dicionários'])
        @disciplinas = @livros.order(:disciplina).uniq.pluck(:disciplina)
        @colecoes = @livros.order(:colecao).uniq.pluck(:colecao)
        @mapDisciplinasColecoes = Hash[@disciplinas.collect { |v| [v, @livros.where(disciplina: v).uniq.pluck(:colecao)]}]
        @mapColecoesObras = Hash[@colecoes.collect { |v| [v, @livros.where(colecao: v).uniq.pluck(:obra)]}]
        @livro = Livro.new
        
    end

    private
        def list_params
            params.require(:list).permit(:segmento, :serie, :escola_id)
        end

        def obra_data
            params.require(:livro).permit(:disciplina, :colecao, :obra, :isbn)
        end
    
end
