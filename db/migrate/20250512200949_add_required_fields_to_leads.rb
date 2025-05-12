class AddRequiredFieldsToLeads < ActiveRecord::Migration[7.1]
  def change
    change_column_null :leads, :email, false
    change_column_null :leads, :first_name, false
    change_column_null :leads, :last_name, false
    change_column_null :leads, :phone, false
  end
end
