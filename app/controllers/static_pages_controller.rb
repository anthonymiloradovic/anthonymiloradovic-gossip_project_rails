class StaticPagesController < ApplicationController
  def team; end

  def accueil
    @gossips = Gossip.all
  end

  def new
    @gossips = Gossip.new
  end

  def contact
    
  end


  def test; end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def home

  end
end
