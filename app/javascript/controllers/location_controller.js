import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.input = this.element
    this.resultsContainer = document.getElementById("autocomplete-results")

    this.input.addEventListener("input", this.search.bind(this))
  }

  search() {
    if (this.input.value.length < 3) return

    fetch(`/announcemnts/search?query=${this.input.value}`)
      .then(res => res.json())
      .then(data => {
        this.resultsContainer.innerHTML = ""
        console.log(data , "data")

        data.forEach(place => {
          const item = document.createElement("a")
          item.classList.add("list-group-item", "list-group-item-action")
          item.innerText = place.label

          item.addEventListener("click", () => {
            this.input.value = place.label
            document.querySelector("#announcemnt_latitude").value = place.latitude
            document.querySelector("#announcemnt_longitude").value = place.longitude
            this.resultsContainer.innerHTML = ""
          })

          this.resultsContainer.appendChild(item)
        })
      })
  }
}
