class PagesController < ApplicationController
  def home
    @variable = ["a","b","c"]
  end

  def results
    @variable = "bonjour"
  end

  def search
    
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

      occurences = [1, 2, 3, 4]


      # une fois les occurences récupérées, on enregistre la requete dans la table Query
      query = Query.new
      query.email = params[:email]
      query.lat = params[:lat]
      query.lng = params[:lng]
      query.result_count = occurences.length
      query.save

      redirect_to "/results"
    end
  end
end
