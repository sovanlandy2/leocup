ActiveAdmin.register Match do
  
  controller do
    def permitted_params
      params.permit match: [:tournament_id, :team_left, :team_right, :match_date, :score, :visible]
    end
  end

  form do |f|
    f.inputs "Match Detail" do 
      f.input :tournament
      f.input :team_left
      f.input :team_right
      f.input :match_date
      f.input :score
      f.input :visible
    end
    f.actions
  end
end