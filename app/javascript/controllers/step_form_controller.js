import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step"]

  connect() {
    this.current = 1
    this.render()
  }

  render() {
    this.stepTargets.forEach(el => {
      el.style.display = Number(el.dataset.step) === this.current ? "block" : "none"
    })
  }

  next() {
    this.save(() => {
      this.current++
      this.render()
    })
  }

  prev() {
    this.current = Math.max(1, this.current - 1)
    this.render()
  }

  save(callback) {
    const form = this.element

    fetch(form.action, {
      method: "PATCH",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      },
      body: new FormData(form)
    })
    .then(r => r.json())
    .then(data => {
      if (data.ok) callback()
      else alert("Validation error")
    })
  }
}