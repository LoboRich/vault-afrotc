import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.input = this.element
    this.resultsContainer = document.getElementById("autocomplete-results")

    this.input.addEventListener("input", this.search.bind(this))
  }

  search() {
    if (this.input.value.length < 3) return

    fetch(`/reservists/search?query=${this.input.value}`)
      .then(res => res.json())
      .then(data => {
        this.resultsContainer.innerHTML = ""

        data.forEach(place => {
          const item = document.createElement("a")
          item.classList.add("list-group-item", "list-group-item-action")
          item.innerText = place.label
          console.log(place, "place")
          item.addEventListener("click", () => {
            this.input.value = place.label
            document.querySelector("#reservist_lat").value = place.latitude
            document.querySelector("#reservist_long").value = place.longitude
            document.querySelector("#reservist_city").value = place.city
            document.querySelector("#reservist_province").value = place.province
            document.querySelector("#reservist_zip_code").value = place.zipcode

            this.resultsContainer.innerHTML = ""
          })

          this.resultsContainer.appendChild(item)
        })
      })
  }
}
