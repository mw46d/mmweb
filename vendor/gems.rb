# Load vendored gems
VENDOR_GEMS_ROOT = File.dirname(__FILE__) + '/gems'
vendored_gem_dirs = ["#{VENDOR_GEMS_ROOT}/*"]
vendored_gem_dirs << "#{VENDOR_GEMS_ROOT}-jruby/*" if RUBY_PLATFORM =~ /java/
vendored_gem_dirs.each do |vd|
  Dir[vd].map do |d|
    File.directory?(lib = "#{d}/lib") ? lib : d
  end.each do |d|
    $LOAD_PATH.unshift d
  end
end
