class EscolasController < ApplicationController
   def new 
       @escola = Escola.new
   end
   
   def edit
      @escola = Escola.find(params[:id])
   end
   
   def show
      @escola = Escola.find(params[:id])
   end
   
   def update
      @escola = Escola.find(params[:id])
      if @escola.update(escola_params)
         flash[:notice] = "Informações da escola atualizadas"
         redirect_to escola_path(@escola)
      else
         render 'edit'
      end
   end
   
   def fetch
       @escola = Escola.where(mec: params[:mec]).first
       if @escola.blank?
           flash[:notice] = "Escola não está no banco de dados"
           redirect_to new_escola_path
       else
          puts "Achou a escola" + "#{@escola.nome}"
           redirect_to edit_escola_path(@escola)
       end
   end
   
   def create
       @escola = Escola.new(escola_params)
       @escola.save
       redirect_to escola_path(@escola)
   end
   
  private
  def escola_params
      params.require(:escola).permit(:mec, :nome, :cnpj, :logradouro, :endereco, :numero, :complemento, :bairro, :cep, :municipio, :uf, :ddd, :telefone1, :telefone2, :site)
  end
    
end
