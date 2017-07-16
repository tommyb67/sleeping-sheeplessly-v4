class ChangeImageTypeInBanners < ActiveRecord::Migration[5.0]
  def change
    change_column :banners, :image, :text
  end
end
