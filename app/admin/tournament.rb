ActiveAdmin.register Tournament do
  
  controller do
    def permitted_params
      params.permit tournament: [:name, :visible]
    end
  end

  form do |f|
    f.inputs "Coach Detail" do 
      f.input :name
      f.input :visible
    end
    f.actions
  end
end