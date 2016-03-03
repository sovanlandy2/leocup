ActiveAdmin.register Match do
  
  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs "Match Detail" do 
      f.input :tournament
      f.input :team_left
      f.input :team_right
      f.input :match_date, as: :date_time_picker
      f.input :score_raw, label: "Match Score (New Line for each score)", as: :text
      f.input :visible
      f.input :is_completed
    end
    f.actions
  end

  index do
    
      column :tournament do |t|
        t.tournament.try(:name)
      end
      column :match_date_sortable, :sortable => 'matches.match_date' do |match|
        match.match_date
      end
      column :team_left do |t|
        t.team_left.try(:name)
      end
      column :match_score do |t|
        t.score.join("|")
      end
      column :team_right do |t|
        t.team_right.try(:name)
      end
      column :is_completed
    actions
  end
end