ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
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
