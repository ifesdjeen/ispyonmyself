module Keylogger
  module OSX
    class Window
      attr_accessor :window

      def self.active
        Application.active.focused_window
      end

      def self.all
        Application.all.map(&:windows).flatten
      end

      def initialize window
        @window = window
      end

      def title
        title = Pointer.new(:id)
        err = AXUIElementCopyAttributeValue(@window, "AXTitle", title)
        title[0]
      end
    end
  end
end
