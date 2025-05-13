import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="leads"
export default class extends Controller {
  static targets = [ "requestedAmount", "monthlySales", "estimatedYearlySalesOutput" ]

  connect() {
    this.calculateEstimatedYearlySales()
  }

  calculateEstimatedYearlySales() {
    const monthlySalesValue = parseInt(this.monthlySalesTarget.value, 10)
    const requestedAmountValue = parseInt(this.requestedAmountTarget.value, 10) // Though not used in calculation, good to have if logic expands

    let yearlySales = 0;

    if (!isNaN(monthlySalesValue) && monthlySalesValue > 0) {
      yearlySales = monthlySalesValue * 12;
    }

    // Formatting as currency (e.g., $ 12,000)
    const formatter = new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    });

    this.estimatedYearlySalesOutputTarget.textContent = formatter.format(yearlySales);
  }
}
