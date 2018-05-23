class PesquisaController < ApplicationController
  before_action :set_deputado, only: [:show, :edit, :update, :destroy]
   require 'httparty'

   # GET /deputados
   # GET /deputados.json
   def index
     @isIndex = true
     @deputados = Pesquisa.all
   end

   # GET /deputados/1
   # GET /deputados/1.json
   def show
   end

   # GET /deputados/lista
   def list
     #api = CamaraApi.new(1)
     #@deputados = api.deputados['dados']
     api = []
     i = 1
     loop do
       aux = HTTParty.get("https://dadosabertos.camara.leg.br/api/v2/deputados?pagina=#{i}&itens=100&ordenarPor=nome")['dados']
       if aux == []
         break
       end
       api += aux
       i += 1
     end

     @deputados = api
     @deputados.each do |deputado|
        deputadoBD = Deputado.where(iddeputado: deputado['id']).first_or_initialize
        deputadoBD.nome = deputado['nome']
        deputadoBD.url_foto = deputado['urlFoto']
        deputadoBD.iddeputado = deputado['id']
        deputadoBD.idlegislatura = deputado['idLegislatura']
      # deputadoBD.partido_id = Partido.find(sigla: deputado['siglaPartido'])
        deputadoBD.save



        aux1 = []
        api2 = []
        j = 1
        loop do
          aux1 = HTTParty.get("https://dadosabertos.camara.leg.br/api/v2/deputados/#{deputado['id']}/despesas?pagina=#{j}&itens=100")['dados']
          if aux1 == []
           break
          end
          api2 += aux1
          j += 1
        end


        api2.each do |despesa|
         if despesa['idDocumento'] != '' or despesa['valorLiquido'] != ''
          auxGasto = deputadoBD.gastos.where(iddocumento: despesa['idDocumento'], valorliquido: despesa['valorLiquido'])
          #print auxGasto.exists?
          if auxGasto.exists?
              # print "Id foi postada"

             if despesa['dataDocumento'] != nil
               data = Date.parse(despesa['dataDocumento'])
             else
              data = ''
             end
             @gasto = auxGasto[0].update(iddocumento: despesa['idDocumento'],data: data, informacao: despesa['tipoDespesa'], valorliquido: despesa['valorLiquido'],valor: despesa['valorDocumento'], cnpjcpffornecedor: despesa["cnpjCpfFornecedor"], nomefornecedor: despesa["nomefornecedor"], urldocumento: despesa["urldocumento"])

          else
           # print "Id nao foi postada"

             if despesa['dataDocumento'] != nil
              data = Date.parse(despesa['dataDocumento'])
             else
              data = ''
             end
             @gasto = deputadoBD.gastos.create(iddocumento: despesa['idDocumento'],data: data, informacao: despesa['tipoDespesa'], valorliquido: despesa['valorLiquido'],valor: despesa['valorDocumento'], cnpjcpffornecedor: despesa["cnpjCpfFornecedor"], nomefornecedor: despesa["nomefornecedor"], urldocumento: despesa["urldocumento"])
         end
        end
       end
     end
   end

   # GET /quem-somos
   def about
   end

   # GET /deputados/new
   def new
     @deputado = Deputado.new
   end

   # GET /deputados/1/edit
   def edit
   end

   def search
     puts @params
   end

   # POST /deputados
   # POST /deputados.json
   def create
     @deputado = Deputado.new(deputado_params)

     respond_to do |format|
       if @deputado.save
         format.html { redirect_to @deputado, notice: 'Deputado was successfully created.' }
         format.json { render :show, status: :created, location: @deputado }
       else
         format.html { render :new }
         format.json { render json: @deputado.errors, status: :unprocessable_entity }
       end
     end
   end

   # PATCH/PUT /deputados/1
   # PATCH/PUT /deputados/1.json
   def update
     respond_to do |format|
       if @deputado.update(deputado_params)
         format.html { redirect_to @deputado, notice: 'Deputado was successfully updated.' }
         format.json { render :show, status: :ok, location: @deputado }
       else
         format.html { render :edit }
         format.json { render json: @deputado.errors, status: :unprocessable_entity }
       end
     end
   end

   # DELETE /deputados/1
   # DELETE /deputados/1.json
   def destroy
     @deputado.destroy
     respond_to do |format|
       format.html { redirect_to deputados_url, notice: 'Deputado was successfully destroyed.' }
       format.json { head :no_content }
     end
   end

   private
     # Use callbacks to share common setup or constraints between actions.
     def set_deputado
       @deputado = Deputado.find(params[:id])
     end

     # Never trust parameters from the scary internet, only allow the white list through.
     def deputado_params
       params.require(:deputado).permit(:nome, :idade, :url_foto,:partido_id,:estado_id)
     end
 end
