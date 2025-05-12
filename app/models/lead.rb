class Lead < ApplicationRecord
  validates :email, :phone, :requested_amount, :monthly_sales, presence: true
end
