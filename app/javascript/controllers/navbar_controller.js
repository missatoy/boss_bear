import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
  }

  updateNavbar() {
    if (window.scrollY > 0) {
      this.element.classList.add("scrolling-active")
    } else {
      this.element.classList.remove("scrolling-active")
    }
  }
}
