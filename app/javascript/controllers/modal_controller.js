import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['display'];
  connect() {
    this.displayTarget.style.display = "block"
  }

  close() {
    this.element.remove()
  }

  submitEnd(event) {
    console.log(event.detail.success)
    if (event.detail.success) {
      this.close()
    }
  }
}
