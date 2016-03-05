ActiveAdmin.register GalleryPhoto do
  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs do 
      f.input :photo, :as => :file , :hint => f.image_tag(f.object.photo.url(:thumb))
      f.input :team_left, label: "Team1"
      f.input :team_right, label: "Team2"
    end
    f.actions
  end
  
end