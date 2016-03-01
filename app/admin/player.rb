ActiveAdmin.register Player do
  controller do
    def permitted_params
      params.permit player: [:name, :number, :team_id, :role, :height]
    end
  end

end