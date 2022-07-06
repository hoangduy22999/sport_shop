import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["product", "shopping_session"]
  add_item() {
    console.log(this.productTarget.value)
    const id = this.shopping_sessionTarget.value
    const product_id = this.productTarget.value
    const csrfToken = document.querySelector("[name='csrf-token']").content
    fetch(`/user/shopping_sessions/${id}`, {
      method: 'PATCH',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({
        cart_items: {
        product_id: this.productTarget.value,
        quantity: 1}
      })
    })
      .then(response => response.json())
      .then(data => {
        document.getElementById("cart").textContent = `CART(${data.items_in_cart})`
      })
  }
}