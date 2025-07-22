class RenameAuthorizeRouteColumnInFranchises < ActiveRecord::Migration[7.1]
  def change
    rename_column :franchises, :authorize_route, :authorize_route_id
  end
end
