ActiveAdmin.register Region do
  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs "Region" do 
      f.input :name
    end

    f.inputs "Team in Region" do 
      f.has_many :teams do |team|
        team.input :name, label: "Team Name"
      end
    end

    f.actions
  end
  
end