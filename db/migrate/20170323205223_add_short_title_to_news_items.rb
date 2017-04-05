class AddShortTitleToNewsItems < ActiveRecord::Migration
  def change
    add_column Refinery::News::Item.table_name, :short_title, :text
  end
end
