require 'faye'

faye_server = Faye::RackAdapter.new(:mount => '/faye', :timeout => 45)

Thread.new { run faye_server }

require 'rspactor'

# HACK, EXTENSIONS shouldn't need to be redefined
RSpactor::Listener::EXTENSIONS = %w[html erb haml sass scss css js rb yml]

Thread.new do
  
  client = Faye::Client.new('http://0.0.0.0:9292/faye')

  listener = RSpactor::Listener.new

  listener.watch { |files|
    for file in files
      case file
      when %r{app/.+\.(erb|haml|sass)$}, %r{/app/helpers/.+\.rb$}, # application view code
          %r{public/.+\.(js|html)$}, # static assets
          %r{config/locales/.+\.yml$} # translation files
      
        file_extension = file.split('.').last

        mapping = { 
                    "sass" => [ "css", "css" ],
                    "png"  => [ "png", "image"],
                    "gif"  => [ "gif", "image"],
                    "jpeg" => [ "jpeg", "image"],
                    "jpg"  => [ "jpg", "image"] }

        extension, type = mapping[file_extension] || [file_extension, file_extension]

        filename = File.basename(file, ".*") + ".#{extension}"

        client.publish('/files', {
          'name'      => [ filename ],
          'timestamp' => Time.now.to_i,
          'type' => type
        })
        
        puts "Reloading #{filename}"

      else
        puts "Unhandled change: #{file}"
      end
    end
  }
  puts "Listening to files"
  listener.start
end

