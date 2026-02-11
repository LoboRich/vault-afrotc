# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js" # @8.0.16
pin "@hotwired/turbo", to: "@hotwired--turbo.js" # @8.0.13
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails/ujs", to: "@rails--ujs.js" # @7.1.3
pin "chartkick" # @5.0.1
pin "Chart.bundle", to: "Chart.bundle.js"
pin "@rails/actioncable/src", to: "@rails--actioncable--src.js" # @8.0.200


pin "chart.js" # @4.5.0
pin "@kurkle/color", to: "@kurkle--color.js" # @0.3.4
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js" # optional for Chart.js integrationpin "jquery" # @4.0.0
pin "datatables.net" # @2.3.7
pin "datatables.net-bs5" # @2.3.7
pin "simple-datatables" # @10.2.0
