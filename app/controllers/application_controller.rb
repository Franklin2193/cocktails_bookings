class ApplicationController < ActionController::Base
  before_action :authenticate_user! # Siempre antes de entrar a cualquier pagina debe estar autentificado
end
