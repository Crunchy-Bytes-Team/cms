module Cms
  class Engine < ::Rails::Engine
    #isolate_namespace Cms

    config.autoload_paths += %W(#{config.root}/app/models/concerns)
    config.autoload_paths += %W(#{config.root}/app/controllers/concerns)
    config.autoload_paths += %W(#{config.root}/app/models/subclasses)
  end
end
