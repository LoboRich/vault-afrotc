pin "application"
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js"
pin "@hotwired/turbo", to: "@hotwired--turbo.js"
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

pin_all_from "app/javascript/controllers", under: "controllers"

pin "@rails/ujs", to: "@rails--ujs.js"

pin "chart.js"
pin "chartkick", to: "chartkick.js"
pin "@kurkle/color", to: "@kurkle--color.js"

pin "simple-datatables"
pin "datatables.net"
pin "datatables.net-bs5"

pin "@rails/actioncable/src", to: "@rails--actioncable--src.js"