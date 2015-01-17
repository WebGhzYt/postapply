class AddStatusToApplies < ActiveRecord::Migration
  def change
    add_column :applies, :apply, :boolean
  end
end
