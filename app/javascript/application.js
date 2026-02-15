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
   const mapEl = document.getElementById("map");
   if (!mapEl) return;
  
   const markersData = JSON.parse(mapEl.dataset.markers);
   const map = L.map("map").setView([10.675, 122.955], 13);
  
   // Tile layer
   L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
     attribution: "&copy; OpenStreetMap contributors"
   }).addTo(map);
  
   // Add markers
   const bounds = [];
   markersData.forEach(marker => {
     L.marker([marker.lat, marker.lng])
       .addTo(map)
       .bindPopup(`<strong>${marker.name}</strong><br>${marker.address}<br><a href="${marker.url}">View</a>`);
     bounds.push([marker.lat, marker.lng]);
   });
  
   if (bounds.length > 0) map.fitBounds(bounds);
  
   // --Search functionality ---
   const input = document.getElementById("address-search");
  
   input.addEventListener("keypress", async (e) => {
     if (e.key === "Enter") {
       e.preventDefault();
       const query = input.value;
       if (!query) return;
  
       const url = `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(query)}`;
       const response = await fetch(url);
       const results = await response.json();
  
       if (results.length === 0) {
         alert("Address not found");
         return;
       }
  
       const first = results[0];
       const lat = parseFloat(first.lat);
       const lon = parseFloat(first.lon);
  
       // Move map and add marker
       L.marker([lat, lon]).addTo(map).bindPopup(query).openPopup();
       map.setView([lat, lon], 15);
     }
   });
});