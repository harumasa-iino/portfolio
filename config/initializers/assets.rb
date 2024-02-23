Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.paths << Rails.root.join("node_modules")

Rails.application.config.assets.precompile += %w[bootstrap.min.js popper.js]

# a)で"bootstap.min.js"ではなく、"bootsrap.js"と書いた場合は、こちらも同じに直す
