class LeadsController < ApplicationController
  include Wicked::Wizard

  steps :personal_info, :business_info, :review
  before_action :set_progress, only: [:show, :update]

  layout 'onboarding'

  def new
    redirect_to leads_path
  end

  def show
    # Fetch the lead id from the session
    if session[:lead_id].present?
      @lead = Lead.find(session[:lead_id])
    else
      @lead = Lead.new
    end
    render_wizard
  end

  def update
    @lead = Lead.new(lead_params)

    if @lead.save
      session[:lead_id] = @lead.id
      redirect_to next_wizard_path
    else
      render_wizard
    end
  end

  private

  def set_progress
    if wizard_steps.any? && wizard_steps.index(step).present?
      @progress = ((wizard_steps.index(step) + 1).to_d / wizard_steps.count.to_d) * 100
    else
      @progress = 0
    end
  end

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
