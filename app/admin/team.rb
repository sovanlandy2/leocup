ActiveAdmin.register Team do
  controller do
    def permitted_params
      params.permit!# :region_id, :name, :description, :avatar, coach_attributes: [:id, :name, :age, :description, :avatar, :team_id], player_attributes: [:id, :name]
    end
  end

  form do |f|
    f.inputs 'Team Profile' do
      # f.translated_inputs "Translated fields", switch_locale: false do |t|
      #   t.input :name
      # end
      f.input :name, label: "Name (translated: #{I18n.locale} )"
      f.input :region
      f.input :description, label: "Description (translated: #{I18n.locale} )"
      f.input :avatar, :as => :file , :hint => f.image_tag(f.object.avatar.url(:thumb))
      f.input :is_winner
      f.input :has_droppedout
    end
    
    f.inputs "Team's Coach" do
      f.has_many :coach do |c|
        c.input :name, label: "Name (translated: #{I18n.locale} )"
        c.input :age
        c.input :description, label: "Description (translated: #{I18n.locale} )"
        c.input :avatar, :as => :file , :hint => f.image_tag(c.object.avatar.url(:thumb))
      end
    end

    f.inputs "Team's Players" do
      f.has_many :players do |p|
        p.input :name, label: "Name (translated: #{I18n.locale} )"
        p.input :number
        p.input :height
        p.input :role
      end
    end

    f.actions
  end

end