$LOAD_PATH << "#{File.expand_path("../../", __FILE__)}/lib/"

require "#{File.expand_path("../../", __FILE__)}/lib/application"

@main_app = Application.new
@main_app.run