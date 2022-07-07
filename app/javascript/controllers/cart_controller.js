import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["product", "shopping_session"]
  add_item() {
    const product_id = this.productTarget.value
    const csrfToken = document.querySelector("[name='csrf-token']").content
    fetch(`/user/cart_items`, {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({
        cart_item: {
        product_id: product_id,
        quantity: 1}
      })
    })
      .then(response => response.json())
      .then(data => {
        document.getElementById("cart").textContent = `CART(${data.items_in_cart})`
      })
  }
}