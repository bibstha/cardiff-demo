class LeadsController < ApplicationController
  include Wicked::Wizard

  steps :personal_info, :business_info, :review

  layout 'onboarding'

  def new
    redirect_to leads_path
  end

  def show
    @lead = Lead.new
    render_wizard
  end

  def update
    @lead = Lead.new(lead_params)

    if @lead.save
      redirect_to next_wizard_path
    else
      render_wizard
    end
  end

  private

  def lead_params
    params.require(:lead).permit(
      # Personal Info
      :requested_amount,
      :monthly_sales,
      :first_name,
      :last_name,
      :email,
      :phone,
      :sms_consent,
      # Business Info
      :business_name,
      :years_in_business,
      :business_classification,
      :ein,
      :home_based,
      :industry,
      :website
    )
  end
end
