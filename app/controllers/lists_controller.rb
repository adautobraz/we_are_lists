class ListsController < ApplicationController
    def new
        @escola = Escola.find(params[:escola_id])
        @list = List.new(escola_id: @escola.id)
    end
    
    def create
        @escola = Escola.find(params[:escola_id])
        @list = List.new(escola_id: @escola.id)
        #@list.segmento = params[:segmento]
 
        if @list.save
            flash[:notice] = "Lista adicionada com sucesso"
            redirect_to escola_list_path(@escola, @list)
        else
            render 'new'
        end
    end
    
    def show
       @list = List.find(params[:id])
       @escola = @list.escola
       #@disciplinas = Livro.where(:segmento => @list.segmento).uniq.pluck(:disciplina);
       @disciplinas = Livro.where(:segmento => List.find(2).segmento).uniq.pluck(:disciplina); 
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
        @disciplinas = Livro.where(:segmento => List.find(2).segmento).uniq.pluck(:disciplina)
        @livro = Livro.new
        
    end

    private
        def list_params
            params.require(:list).permit(:nome_escola, :segmento)
        end
        
        def livro_params
            params.require(:list).permit(:isbn)
        end
    
end
