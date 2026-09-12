class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to perfil_path, notice: "Ya has iniciado sesión."
    end
  end

  def create
    email = params[:email].to_s.strip.downcase
    username = email.split('@').first.capitalize

    if email.present?
      user = User.find_or_create_by(email: email) do |u|
        u.username = username
        u.pro_subscriber = false
        u.travel_level = 1
      end

      session[:user_id] = user.id
      session[:is_guest] = false
      flash[:notice] = "¡Bienvenido de nuevo, #{user.username}!"
      redirect_to perfil_path
    else
      flash.now[:alert] = "Por favor ingresa un correo electrónico válido."
      render :new, status: :unprocessable_entity
    end
  end

  def guest
    session[:user_id] = nil
    session[:is_guest] = true
    flash[:notice] = "Has ingresado en Modo Invitado. Puedes explorar la plataforma libremente."
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    session[:is_guest] = nil
    flash[:notice] = "Has cerrado sesión correctamente."
    redirect_to login_path
  end
end
