ActionController::Routing::Routes.draw do |map|

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.resources :corpocaldas, :collection => {
    :test => :get
  }

  map.resources :wsaud, :collection => {
    :recibir_datos_audiencia_publica => :get,
    :respuesta_inscripcion_audiencia => :get,
    :aprueba_inscripcion_audiencia => :get,
    :datos_inscripcion_audiencia => :get,
    :inscripcion_audiencia_aa => :get
  }

  map.resources :wsces02, :collection => {
    :cambiar_cesionario => :get
  }

  map.resources :wsinf, :collection => {
    :recibir_informacion_ee => :get
  }

  map.resources :wsnot, :collection => {
    :actualizar_estado_notificacion => :get,
    :verificar_estado_notificacion => :get
  }

  map.resources :wspq01, :collection => {
    :recibir_publicacion => :get,
    :recibir_fijacion => :get,
    :aclarar_pubicacion => :get,
    :aclarar_fijacion => :get,
    :eliminar_publicacion_fijacion => :get
  }

  map.resources :wspq02, :collection => {
    :enviar_comunicacion => :get,
    :enviar_comunicacion_visita => :get,
    :monitorear_respuesta_ee => :get
  }

  map.resources :wspq03, :collection => {
    :recibir_documento => :get,
    :emitir_documento => :get,
    :obtener_datos_adjuntos => :get,
    :enviar_datos_radicacion => :get
  }

  map.resources :wspq04, :collection => {
    :recibir_datos_cobro => :get,
    :enviar_datos_pago => :get,
    :monitorear_pago => :get
  }

  map.resources :wspq05, :collection => {
    :recibir_datos_cobro  => :get
  }

  map.resources :wssan, :collection => {
    :respuesta_queja_denuncia => :get
  }

  map.resources :wssun, :collection => {
    :recibir_datos_salvoconducto => :get
  }

  map.resources :xmltest, :collection => {

  }
  
end
