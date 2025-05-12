class LeadsController < ApplicationController
  include Wicked::Wizard

  steps :personal_info, :business_info, :review

  layout "onboarding"
  
  def show
    @lead = Lead.new
    render_wizard
  end

  def update
    @lead = Lead.new(lead_params)
    render_wizard @lead
  end

  private

  def lead_params
    params.require(:lead).permit(
      :funding_needed,
      :average_monthly_sales,
      :first_name,
      :last_name,
      :business_email,
      :cell_phone,
      :terms_accepted
    )
  end
  
end
