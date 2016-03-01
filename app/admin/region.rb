ActiveAdmin.register Region do
	controller do
    def permitted_params
      params.permit region: [ :name]
    end
  end
  
end