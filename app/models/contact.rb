class Contact < ActiveRecord::Base
  validates :name, :email, :content, presence: true
  validates :content, length: {maximum: 255}
end
