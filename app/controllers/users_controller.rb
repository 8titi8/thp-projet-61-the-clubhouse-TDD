class UsersController < ApplicationController

  def index
    if logged_in?
      @user = User.all
      render 'index'
    else
      flash[:danger] = 'Vous devez vous connecter pour accéder à cette page !'
      redirect_to login_path
    end
  end

  def show
    if current_user.nil?
      flash[:danger] = 'Vous devez vous connecter pour accéder à cette page !'
      redirect_to login_path
    elsif current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      render 'show'
    else
      flash[:danger] = 'Vous devez vous connecter pour accéder à cette page !'
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Bravo, vous êtes bien inscrit !"
      redirect_to user_path(@user.id)
    else
      flash[:warning] = "Pour vous inscrire, veuillez remplir tous les champs"
      render 'new'
    end
  end

  def edit
    if current_user.nil?
      flash[:danger] = 'Vous devez vous connecter pour accéder à cette page !'
      redirect_to login_path
    elsif current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      render 'edit'
    else
      flash[:danger] = 'Vous devez vous connecter pour accéder à cette page !'
      redirect_to login_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Vos informations ont bien été mises à jour !'
      redirect_to user_path(@user.id)
    else
      flash[:warning] = 'Attention, pour modifier vos informations il faut entrer un mot de passe valide'
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to home_path
  end

  private

  def user_params
    p param = params.permit(:first_name, :last_name, :email, :password)
  end
end
