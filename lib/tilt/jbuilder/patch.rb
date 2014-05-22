require 'tilt/jbuilder/patch/version'
require 'jbuilder'
require 'tilt/jbuilder'

module Tilt
  class Jbuilder < ::Jbuilder
    module Patch
      Template.class_eval do
        def read_template_file
          file_path = File.exists?(file) ? file : "app/views#{file}"
          data = File.open(file_path, 'rb') { |io| io.read }
          if data.respond_to?(:force_encoding)
            # Set it to the default external (without verifying)
            data.force_encoding(Encoding.default_external) if Encoding.default_external
          end
          data
        end
      end
    end

    JbuilderTemplate.class_eval do
      def evaluate(scope, locals, &block)
        scope ||= Object.new
        ::Tilt::Jbuilder.encode(scope) do |json|
          context = scope.instance_eval { binding }
          set_locals(locals, scope, context)
          if data.kind_of?(::Proc)
            return data.call(::Tilt::Jbuilder.new(scope))
          else
            partial_path = data.match(/json\.partial\![ (]*['"](.*)['"]/)

            if partial_path.present?
              data.gsub!(partial_path[1], "app/views/#{partial_path[1]}")
              data.gsub!(%r(//+), '/')
            end

            eval(data, context)
          end
        end
      end
    end
  end
end
