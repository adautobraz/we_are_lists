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
            flash[:notice] = "Preencha todos os campos obrigatórios"
            redirect_to new_escola_list_livro_path(@list.escola, @list)        
        end
    end
    
    def edit
        @escola = Escola.find(params[:escola_id])
        @list = List.find(params[:list_id])
        @livro = Livro.find(params[:id])
    end
    
    def update
        @escola = Escola.find(params[:livro][:escola_id])
        @list = List.find(params[:livro][:list_id])
        @livro = Livro.find(params[:id])
        if @livro.update(livro_params)
            flash[:notice] = "As informações do livro foram atualizadas"
            redirect_to escola_list_path(@escola, @list)        
        else
            redirect_to edit_escola_list_livro_path(@escola, @list, @livro)
        end
    end
   
    
    private
        def livro_params
            params.require(:livro).permit(:selo, :edicao, :disciplina, :obra, :autor, :volume_serie)
        end
    
end
