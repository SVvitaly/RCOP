class EmailSetting < ActiveRecord::Base
  validates :first_name, :last_name, :patronymic, :email, :text, :address, presence: { message: "Can't be blank "  }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :text, length: { maximum: 2000 }

end
