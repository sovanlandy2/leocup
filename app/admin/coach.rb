ActiveAdmin.register Coach do
  
  controller do
    def permitted_params
      params.permit coach: [:avatar, :name, :team_id, :age]
    end
  end

  form do |f|
    f.inputs "Coach Detail" do 
      f.input :name
      f.input :age
      f.input :team
      f.input :avatar, :as => :file , :hint => f.image_tag(f.object.avatar.url(:thumb))
      # Will preview the image when the object is edited
    end
    f.actions
  end
end