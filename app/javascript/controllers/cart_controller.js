import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  add_item() {
    console.log(this.element)
  }
}