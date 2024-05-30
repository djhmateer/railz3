# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
# pin "@rails/activestorage", to: "activestorage.js"
# pin "activestorage" # @5.2.8
pin "@rails/activestorage", to: "activestorage.esm.js"

pin "direct_uploads", to: "direct_uploads.js"



