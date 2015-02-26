guard 'rspec' do
  # watch /lib/ files
  watch(%r{^lib/(.+).rb$}) do |m|
    "spec/#{m[1]}_spec.rb"
  end

  # watch /spec/ files
  watch(%r{^spec/(.+).rb$}) do |m|
    "spec/#{m[1]}.rb"
  end

  # watch /feature/ files
  watch(%r{^feature/(.+).rb$}) do |m|
    "feature/#{m[1]}.rb"
  end
  
end
