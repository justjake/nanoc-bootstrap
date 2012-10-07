# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
include Nanoc::Helpers::Rendering

module Externs
    def create_externs(externs, join_string = "\n", &block)
        if externs
            if block_given?
                externs.map(&block).join(join_string)
            else
                externs.join(join_string)
            end
        else
            "" # no externs provided
        end
    end

    def item_scripts(item = @item)
       create_externs item[:scripts] { |path| '<script src="%s" type="text/javascript"></script>' % [path] }
    end

    def item_styles(item = @item)
        create_externs item[:styles] { |path| '<link rel="stylesheet" type="text/css" href="%s" />' % [path] }
    end

    def body_classes(item = @item)
        ' class="%s" ' % [create_externs(item[:body_classes], " ")]
    end
end

include Externs
