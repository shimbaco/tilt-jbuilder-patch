require 'jbuilder'
require 'rails'

module Tilt
  class Jbuilder < ::Jbuilder
    module Patch
      class Railtie < Rails::Railtie
        initializer 'tilt_jbuilder_patch.action_controller' do
          require 'tilt/jbuilder/patch/action_controller'

          ActionController::Base.send(:include,  Tilt::Jbuilder::Patch::ControllerMethods)
        end
      end
    end
  end
end
