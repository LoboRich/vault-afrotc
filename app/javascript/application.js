import "@hotwired/turbo-rails"

// Debug: confirm JS is loading
console.log("application.js loaded")
import "controllers"
import { DataTable } from "simple-datatables"


document.addEventListener("turbo:load", () => {
  const table = document.querySelector(".datatable");
  if (!table) return;

  const dataTable = new DataTable(table, {
    searchable: true,
    fixedHeight: false,
    perPage: 10,
    perPageSelect: [5, 10, 25, 50],
    labels: {
      placeholder: "Search...", // Search placeholder
      perPage: "entries per page", // per-page dropdown label
      noRows: "No entries to found",
      info: "Showing {start} to {end} of {rows} entries",
    },
  });
});


document.addEventListener("turbo:load", function () {
  const mapEl = document.getElementById("map");
  if (!mapEl) return;

  const markersData = JSON.parse(mapEl.dataset.markers || "[]");

  // Prevent double initialization
  if (mapEl._leaflet_id) return;

  const map = L.map("map").setView([10.675, 122.955], 13);

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "&copy; OpenStreetMap contributors"
  }).addTo(map);

  // Add existing markers
  const bounds = [];
  markersData.forEach(marker => {
    L.marker([marker.lat, marker.lng])
      .addTo(map)
      .bindPopup(
        `<strong>${marker.name}</strong><br>${marker.address}<br><a href="${marker.url}">View</a>`
      );
    bounds.push([marker.lat, marker.lng]);
  });

  if (bounds.length > 0) map.fitBounds(bounds);

  // -------------------------
  // 🔥 AUTO MOVE MAP WHEN LAT/LNG CHANGES
  // -------------------------

  const latField = document.getElementById("announcemnt_latitude");
  const lngField = document.getElementById("announcemnt_longitude");
  if (!latField || !lngField) return;
  
  let searchMarker = null;

  function updateMapFromFields() {
    const lat = parseFloat(latField.value);
    const lng = parseFloat(lngField.value);

    if (!lat || !lng) return;

    // Remove old search marker
    if (searchMarker) {
      map.removeLayer(searchMarker);
    }

    // Add new marker
    searchMarker = L.marker([lat, lng])
      .addTo(map)
      .bindPopup("Selected Location")
      .openPopup();

    map.setView([lat, lng], 15);
  }

  // Trigger when values change
  latField.addEventListener("change", updateMapFromFields);
  lngField.addEventListener("change", updateMapFromFields);

  // ALSO trigger when value is updated via JS (important!)
  const observer = new MutationObserver(updateMapFromFields);

  observer.observe(latField, { attributes: true, attributeFilter: ["value"] });
  observer.observe(lngField, { attributes: true, attributeFilter: ["value"] });
});

// ------------------------- JSONB FIELDS -------------------------
document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("button[id^='add-']").forEach(button => {
    button.addEventListener("click", function () {
      const containerId = this.dataset.container
      const fields = this.dataset.fields.split(",")

      const container = document.getElementById(containerId)

      // Main row
      const row = document.createElement("div")
      row.classList.add("row", "jsonb-item", "mb-3", "position-relative")

      // Inputs
      fields.forEach(field => {
        const col = document.createElement("div")
        col.classList.add("col-md-3")

        const input = document.createElement("input")
        input.type = "text"
        input.name = `reservist[${this.dataset.field}][][${field}]`
        input.placeholder = field
          .replace(/_/g, " ")
          .replace(/\b\w/g, c => c.toUpperCase())

        input.classList.add("form-control")

        col.appendChild(input)
        row.appendChild(col)
      })

      // Floating remove button
      const removeBtn = document.createElement("button")
      removeBtn.type = "button"

      removeBtn.classList.add(
        "btn",
        "btn-danger",
        "remove-item",
        "position-absolute"
      )

      removeBtn.style.top = "-10px"
      removeBtn.style.right = "-10px"
      removeBtn.style.width = "30px"
      removeBtn.style.height = "30px"
      removeBtn.style.borderRadius = "50%"
      removeBtn.style.padding = "0"

      removeBtn.innerText = "✕"

      removeBtn.addEventListener("click", () => row.remove())

      row.appendChild(removeBtn)

      container.appendChild(row)
    })
  })

  // Remove existing rows
  document.addEventListener("click", function (e) {
    if (e.target.classList.contains("remove-item")) {
      e.target.closest(".jsonb-item").remove()
    }
  })
})