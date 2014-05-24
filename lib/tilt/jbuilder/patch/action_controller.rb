require 'jbuilder'

module Tilt
  class Jbuilder < ::Jbuilder
    module Patch
      module ControllerMethods
        module InstanceMethods
          def encode_jbuilder(path)
            template = Tilt::JbuilderTemplate.new(path)
            scope = Object.new

            view_assign_variables.each do |variable|
              scope.instance_variable_set(variable, instance_variable_get(variable))
            end

            scope.class.send(:include, AbstractController::Helpers)
            scope.class.send(:include, Devise::Controllers::Helpers)

            template.render(scope)
          end

          private def view_assign_variables
            variables =  instance_variables
            variables -= ActionController::Base.send(:protected_instance_variables).to_a
            variables -= AbstractController::Rendering::DEFAULT_PROTECTED_INSTANCE_VARIABLES.to_a
            variables
          end
        end

        def self.included(receiver)
          receiver.send(:include, InstanceMethods)
        end
      end
    end
  end
end
