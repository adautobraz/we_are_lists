class EscolasController < ApplicationController
   def new
      @escola = Escola.new
      @mec = params[:mec]
      puts("O mec dessa escola vale" + "#{@mec}")
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
         flash[:notice] = "Preencha todos os campos obrigatórios"
         redirect_to edit_escola_path(@escola)
      end
   end
   
   def fetch
      @escola = Escola.where(mec: params[:mec]).first
      @mec = params[:mec]
      if @escola.blank?
         flash[:notice] = "Escola não está no banco de dados"
         redirect_to new_escola_path(mec: @mec)
      else
         flash[:notice] = "Escola não está no banco de dados"
         puts "Achou a escola" + "#{@escola.nome}"
         redirect_to edit_escola_path(@escola)
      end
   end
   
   def create
      @escola = Escola.new(escola_params)
      @mec = escola_params[:mec]
      if @escola.save
         flash[:notice] = "Dados atualizadas com sucesso"
         redirect_to escola_path(@escola)
      else
         flash[:notice] = "Preencha todos os campos obrigatórios"
         redirect_to new_escola_path(mec: @mec)
      end

   end
   
  private
  def escola_params
      params.require(:escola).permit(:mec, :nome, :cnpj, :endereco, :bairro, :cep, :municipio, :uf,:telefone1, :telefone2, :site)
  end
    
end
