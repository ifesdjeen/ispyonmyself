module Keylogger
  module OSX

    class Application
      def self.active
        info = NSWorkspace.sharedWorkspace.activeApplication
        pid = info["NSApplicationProcessIdentifier"]
        new pid
      end

      def self.all
        NSWorkspace.sharedWorkspace.runningApplications.map{|app|
          new app.processIdentifier
        }
      end

      def initialize pid
        @pid = pid
        @app = AXUIElementCreateApplication pid
      end

      def focused_window
        window = Pointer.new(:id)
        err = AXUIElementCopyAttributeValue(@app,
              NSAccessibilityFocusedWindowAttribute,
              window)
        Window.new window[0]
      end

      def windows
        windows = Pointer.new(:id)
        err = AXUIElementCopyAttributeValue(@app,
              KAXWindowsAttribute,
              windows)
        (windows[0] || []).map{|w| Window.new w} || []
      end

      def title
        title = Pointer.new(:id)
        err = AXUIElementCopyAttributeValue(@app, "AXTitle", title)
        title[0]
      end
    end

  end
end
