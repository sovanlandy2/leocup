ActiveAdmin.register Post do
  controller do
    def permitted_params
      params.permit!# :region_id, :name, :description, :avatar, coach_attributes: [:id, :name, :age, :description, :avatar, :team_id], player_attributes: [:id, :name]
    end
  end

  form do |f|
    f.inputs 'News Content' do
      f.input :title, label: "Title (translated: #{I18n.locale} )"
      f.input :source, label: "Source (translated: #{I18n.locale} )"
      f.input :content, label: "Content (translated: #{I18n.locale} )"
    end
    
    f.inputs "Photos" do
      f.has_many :post_photos do |c|
        c.input :photo, :as => :file , :hint => f.image_tag(c.object.photo.url(:thumb))
      end
    end

    f.actions
  end

end