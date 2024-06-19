require 'bundler/setup'

Bundler.require(:default)

require 'rack/static'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :get
  end
end

use Rack::Static, urls: ['/'], root: 'public'

run lambda { |env| [200, { 'Content-Type' => 'text/html' }, ['All responses are served via Rack::Static']] }
