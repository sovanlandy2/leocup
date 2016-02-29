ActiveAdmin.register Team do
  # ...
  permit_params :name, :region, :description, :avatar
end