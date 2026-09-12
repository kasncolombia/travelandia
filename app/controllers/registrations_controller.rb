class RegistrationsController < ApplicationController
  def new
    if logged_in?
      redirect_to perfil_path, notice: "Ya tienes una cuenta activa."
    end
  end

  def create
    email = params[:email].to_s.strip.downcase
    username = params[:username].to_s.strip

    if username.blank?
      username = email.split('@').first.capitalize
    end

    if email.present?
      user = User.find_or_initialize_by(email: email)
      user.username = username if user.new_record? || user.username.blank?
      user.pro_subscriber = true
      user.travel_level = 1

      if user.save
        session[:user_id] = user.id
        session[:is_guest] = false
        flash[:notice] = "¡Cuenta creada exitosamente! Bienvenido a TravelIA, #{user.username}."
        redirect_to perfil_path
      else
        flash.now[:alert] = user.errors.full_messages.to_sentence
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "Por favor completa todos los campos requeridos."
      render :new, status: :unprocessable_entity
    end
  end
end
