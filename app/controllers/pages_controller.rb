class PagesController < ApplicationController
  def home
    
  end

  def results
    
    # on vérifie que l'on dispose de toute les données
    if(params[:email].blank? || params[:lat].nil? || params[:lng].nil?)
      redirect_to "/home"
    else

      # on effectue la recherche sur 1 km
      @occurences = Transaction.within(1, :units => :kms, :origin => [params[:lat].to_f, params[:lng].to_f])

      # si la géolocalisation est indisponible, on prend les coordonnées de Paris par défaut
      @currentLat = params[:lat]
      @currentLng = params[:lng]

      # on créé les markers pour la map
      @hash = Gmaps4rails.build_markers(@occurences) do |trs, marker|
        marker.lat trs.lat
        marker.lng trs.lng
      end

      # une fois les occurences récupérées, on enregistre la requete dans la table Query
      query = Query.new
      query.email = params[:email]+"@homeloop.fr"
      query.lat = params[:lat]
      query.lng = params[:lng]
      query.result_count = @occurences.length
      query.save
    end
  end
end
