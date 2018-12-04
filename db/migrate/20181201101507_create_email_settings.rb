class CreateEmailSettings < ActiveRecord::Migration
  def change
    create_table :email_settings do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.string :email
      t.text :text, :limit => 2000
      t.string :address
      t.string :file
      t.string :postal_code
      t.timestamps
    end
  end
end
