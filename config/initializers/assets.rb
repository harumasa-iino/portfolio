Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Rails.application.config.assets.precompile += %w[application.js]

# a)で"bootstap.min.js"ではなく、"bootsrap.js"と書いた場合は、こちらも同じに直す
