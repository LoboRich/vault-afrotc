import "@hotwired/turbo-rails"
import "controllers"
import { DataTable } from "simple-datatables"

// Debug: confirm JS is loading
console.log("application.js loaded")

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
  const mapElement = document.getElementById("map");
  if (!mapElement) return; // stops if #map is not found

  const markersData = JSON.parse(mapElement.dataset.markers);

  const map = L.map("map").setView([10.675, 122.955], 13); // center of Bacolod

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "&copy; OpenStreetMap contributors"
  }).addTo(map);

  const bounds = [];

  markersData.forEach(marker => {
    L.marker([marker.lat, marker.lng])
      .addTo(map)
      .bindPopup(
        `<strong>${marker.name}</strong><br>${marker.address}<br><a href="${marker.url}">View</a>`
      );

    bounds.push([marker.lat, marker.lng]);
  });

  if (bounds.length > 0) {
    map.fitBounds(bounds);
  }
});
