# encoding: utf-8

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
    
    def download
        @list = List.find(params[:id])
        @escola = @list.escola
        respond_to do |format|
            format.html
            format.pdf do
                render :pdf => "my_pdf_name.pdf",
                    :disposition => "inline",
                    :template => "lists_controller/show.pdf.erb"
            end 
        end
    end
    
    def mostrar
        @list = List.find(params[:id])
        @escola = @list.escola
        html = render_to_string(:action => :show, :layout => "show.html.erb")
        pdf = wicked_pdf.new.pdf_from_string(html)
        send_data(pdf, :filename => "ListaDeLivros.pdf", :disposition => 'attachment')
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
            params.require(:list).permit(:nome_escola, :segmento)
        end
        
        def livro_params
            params.require(:list).permit(:isbn)
        end
    
end
