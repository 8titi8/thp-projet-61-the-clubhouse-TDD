module SessionsHelper

  # Méthode qui permet de démarrer une session (qui sera enregistrée dans le navigateur de l’utilisateur)
  def log_in(user)
    session[:user_id] = user.id
  end

  # Méthode qui permet de vérifier à chaque changement de page, si un utilisateur a une session en cours
  def current_user
    if @current_user.nil?
        @current_user = User.find_by(id: session[:user_id])
    else
      @current_user
    end
  end

  # Méthode qui détermine si un utilisateur est déjà connecté, renvoie true si l’utilisateur est connecté, sera utilisée pour l’affichage de la nav bar
  def logged_in?
    !current_user.nil?
  end

  # Méthode pour déconnecter l’utilisateur de sa session
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end



end
