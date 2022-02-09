# This migration comes from hyrax (originally 20161116222307)
class AddReleaseToPermissionTemplates < ActiveRecord::Migration[5.0]
  def change
    add_column :permission_templates, :release_date, :date
    add_column :permission_templates, :release_period, :string
  end
end
