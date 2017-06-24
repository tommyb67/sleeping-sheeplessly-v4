class AddStatusToBanner < ActiveRecord::Migration[5.0]
  def change
    add_column :banners, :status, :integer, default: 0
  end
end
