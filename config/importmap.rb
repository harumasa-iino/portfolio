# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin "application", to: "controllers/application.js"
pin "hello_controller", to: "controllers/hello_controller.js"
pin_all_from 'app/javascript/controllers', under: 'controllers'

