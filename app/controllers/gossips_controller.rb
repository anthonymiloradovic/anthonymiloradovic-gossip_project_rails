class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossips = Gossip.find(params[:id])
  end


  def new
    @gossips = Gossip.new
    
  end

  
    
  def create
    user = User.find(1)
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: user.id)

    if @gossip.save
      redirect_to(root_path, notice: 'Le potin a été correctement enregistré')
    else
      flash.now[:alert] = 'mauvaises entrées de formulaire'
      render(action: 'new')
    end

    
  end

  def edit
    @gossips = Gossip.find(params[:id])
  end

  def update
    @gossips = Gossip.find(params[:id])
    #@gossips = Gossip.all.find_by(id:params[:id])
    @gossips.update(title: params[:title], content: params[:content])
    redirect_to gossips_path
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    # La méthode delete retourne le nombre de gossips supprimés
    nb_deleted_gossips = Gossip.delete(params['id'])
    if nb_deleted_gossips > 0
      redirect_to(root_path, notice: 'Le potin a été correctement supprimé')
    else
      redirect_to(root_path, alert: 'erreur lors de la suppression')
    end
  end

  private

  def gossips_params
    params.require(:gossip).permit(:title, :content)
  end
end
