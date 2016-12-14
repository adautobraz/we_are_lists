# encoding: utf-8

class ListsController < ApplicationController
    def new
        @escola = Escola.find(params[:escola_id])
        @list = List.new
    end
    
    def create
        @escola = Escola.find(list_params[:escola_id])
        @list = List.new(list_params)

        if @list.save
            flash[:notice] = "Lista adicionada com sucesso"
            redirect_to escola_list_path(@escola, @list)
        else
            redirect_to new_escola_list_path(escola_id: @escola.id)
        end
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
        @disciplinas = Livro.where(:segmento => List.find(2).segmento).uniq.pluck(:disciplina)
        @livro = Livro.find_by(:isbn => params[:isbn])
        if @livro.nil?
            flash[:notice] = "Livro não está na base dados"
            redirect_to edit_list_path(@list)
        else
            @list.livros << @livro
            render 'show'
        end
    end
    
    def remove
       @list.livros.delete(Livro.find(params[:livro_id]))
       render 'show'
    end
    
    def edit
        @list = List.find(params[:id])
        #@disciplinas = Livro.where(:segmento => List.find(2).segmento).uniq.pluck(:disciplina)
        @livro = Livro.new
        
    end

    private
        def list_params
            params.require(:list).permit(:segmento, :serie, :escola_id)
        end
        
        def livro_params
            params.require(:list).permit(:isbn)
        end
    
end
