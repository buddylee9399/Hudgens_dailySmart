class ApplicationController < ActionController::Base
    
    include DeviseConcern
    include PunditConcern


end
