class AddImageToNewsItems < ActiveRecord::Migration
  def change
    add_column Refinery::News::Item.table_name, :image, :string
  end
end
