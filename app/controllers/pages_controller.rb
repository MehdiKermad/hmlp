class PagesController < ApplicationController
  def home
    
  end

  def results
    
    # on vérifie que l'on dispose de toute les données
    if(params[:email].blank? || params[:lat].nil? || params[:lng].nil?)
      redirect_to "/home"
    else

      # on calcul le rayon (radius)
      #acos(sin(a.Latitude * 0.0175) * sin(params[:lat] * 0.0175) 
      #         + cos(a.Latitude * 0.0175) * cos(params[:lat] * 0.0175) *    
      #           cos((params[:lng] * 0.0175) - (a.Longitude * 0.0175))
      #        ) * 6371

      # on effectue la recherche sur 1 km
      #occurences = Query.where :lat => params[:lat], :lng => params[:lng], :with => {:geodist => 0.0..1_000.0}

      @occurences = Transaction.all


      # une fois les occurences récupérées, on enregistre la requete dans la table Query
      query = Query.new
      query.email = params[:email]
      query.lat = params[:lat]
      query.lng = params[:lng]
      query.result_count = @occurences.length
      query.save
    end
  end
end
