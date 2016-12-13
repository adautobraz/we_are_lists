class LivrosController < ApplicationController
    def new
        @escola = Escola.find(params[:escola_id])
        #@livro = livro.new(escola_id: @escola.id)
        @list = List.find(params[:list_id]) 
        @livro = Livro.new
    end
    
    def create
        @list = List.find(params[:livro][:list_id])
        @livro = Livro.new(livro_params)
 
        if @livro.save
            flash[:notice] = "livro adicionado com sucesso"
            @list.livros << @livro
            redirect_to list_path(@list)
        else
            flash[:notice] = "Não foi possível adicionar este livro"
            redirect_to list_path 'new'
        end
    end
    
    def edit
        @livro = livro.find(params[:id])
    end
   
    
    private
        def livro_params
            params.require(:livro).permit(:selo, :edicao, :disciplina, :obra, :autor, :volume_serie)
        end
    
end
