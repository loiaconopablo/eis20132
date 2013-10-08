JobVacancy::App.controllers :consultas do
  
  get :my do
    @consultas_encontradas = Consulta.find_by_owner(current_user)
    render 'consultas/my_consultas'
  end    

  # get :index do
  #   @offers = JobOffer.all
  #   render 'job_offers/search'
  # end  

  get :new, :with =>:offer_id  do
    @consulta = Consulta.new
    @job_offer = JobOffer.get(params[:offer_id])
    render 'consultas/new'
  end

  # get :latest do
  #   @offers = JobOffer.all
  #   render 'job_offers/list'
  # end

  get :edit, :with =>:consulta_id  do
    @consulta = Consulta.get(params[:consulta_id])
    # ToDo: validate the current user is the owner of the offer
    render 'consultas/edit'
  end

  get :apply, :with =>:consulta_id   do
    @consulta = Consulta.get(params[:consulta_id ])
    # ToDo: validate the current user is the owner of the offer
    render 'consultas/apply'
  end

  post :create do
    @consulta = Consulta.new(params[:consulta])
    @consulta.owner = current_user
    if @consulta.save
      flash[:success] = 'Consulta Creada'
      redirect '/consultas/my'
    else
      flash.now[:error] = 'Title and Description are mandatory'
      render 'consultas/new'
    end  
  end

  post :update, :with => :consulta_id do
    @consulta = Consulta.get(params[:consulta_id])
    @consulta.update(params[:consulta])
    if @consulta.save
      flash[:success] = 'Consulta actualizada'
      redirect '/consultas/my'
    else
      flash.now[:error] = 'Title and Description are mandatory'
      render 'consultas/edit'
    end  
  end

  delete :destroy do
    @consulta = Consulta.get(params[:consulta_id])
    if @consulta.destroy
      flash[:success] = 'Offer deleted'
    else
      flash.now[:error] = 'Title is mandatory'
    end
    redirect 'consultas/my'
  end

end
