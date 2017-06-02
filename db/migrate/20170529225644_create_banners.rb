class CreateBanners < ActiveRecord::Migration[5.0]
  def change
    create_table :banners do |t|
      t.date :start_date
      t.date :end_date
      t.text :location
      t.text :headline
      t.text :subcopy
      t.string :image

      t.timestamps
    end
  end
end
