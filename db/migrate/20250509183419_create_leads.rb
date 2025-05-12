class CreateLeads < ActiveRecord::Migration[7.1]
  def change
    create_table :leads do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.decimal :monthly_sales
      t.decimal :requested_amount
      t.boolean :sms_consent
      t.boolean :sms_opt_in
      t.string :business_name
      t.string :year_in_business
      t.string :business_classification
      t.string :ein
      t.boolean :home_based
      t.string :industry
      t.string :website
      t.string :utm_browser
      t.string :utm_device_type
      t.string :utm_os

      t.timestamps
    end
  end
end
