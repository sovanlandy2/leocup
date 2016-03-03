ActiveAdmin.register SliderPhoto do
  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs do 
      f.input :caption
      f.input :photo, :as => :file , :hint => f.image_tag(f.object.photo.url(:thumb))
      f.input :order
      
    end
    f.actions
  end
  
end