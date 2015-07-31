require 'sprockets'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'public/assets/stylesheets'
  environment.append_path 'public/assets/javascripts'
  environment.append_path 'public/assets/images'
  environment.append_path 'public/assets/fonts'
  run environment
end

use Rack::Static,
  :urls => ["/drbc_2015_sponsorship.pdf", "/coc.html", "/assets/bower_components/jquery/dist"],
  :root => "public"

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('public/index.html', File::RDONLY)
  ]
}
