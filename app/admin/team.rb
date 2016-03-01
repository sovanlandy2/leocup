ActiveAdmin.register Team do
  controller do
    def permitted_params
      params.permit team: [:region_id, :name, :description, :avatar]
    end
  end

  form do |f|
    f.inputs "Team Detail" do 
      f.input :name
      f.input :region
      f.input :description
      f.input :avatar, :as => :file , :hint => f.image_tag(f.object.avatar.url(:thumb))
    end
    f.actions
  end
end