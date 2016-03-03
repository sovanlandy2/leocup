ActiveAdmin.register Tournament do
  
  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs "Tournament Detail" do 
      f.input :name
      f.input :start_date, as: :date_picker
      f.input :end_date, as: :date_picker
      f.input :location
      f.input :visible

    end

    f.inputs "Team Pool" do 
      f.has_many :pools do |pool|
        pool.input :name, label: "PoolName"
        pool.has_many :team_pools do |t|
          t.input :team
        end
      end

    end

    f.actions
  end
end
