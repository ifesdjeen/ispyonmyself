require 'csv'
require 'json'

module Keylogger
  module OSX
    class AppDelegate

      def initialize(log_tree_path)
        @log_tree_path = log_tree_path
      end

      def report(event_type, attributes)
        # Eventoverse.reporter.publish_message(event_type, attributes)
      end

      def log_keys
        # pw = ::Keylogger::PeriodicWindow.new(0, 5,
        #                     lambda { |a, b| a + 1 },
        #                     lambda do |v|
        #                           open ("#{@log_tree_path}/keystrokes_per_minute", 'a') do |f|
        #                             f.puts(CSV.generate do |csv| csv << [Time.now.to_i, v] end)
        #                           end
        #                         end)
        NSEvent.addGlobalMonitorForEventsMatchingMask(NSKeyDownMask, handler:Proc.new do |event|
                                                        open ("#{@log_tree_path}/key_press", 'a') do |f|
                                                          f.puts(CSV.generate do |csv| csv << [Time.now.to_i, event.keyCode, event.modifierFlags] end)
                                                        end
                                                        # report("key_pressed", { :char => event.keyCode, :modifier_flags => event.modifierFlags})
                                                        # pw.enqueue(event)
                                                      end)
      end

      def log_windows
        last_window_title = nil
        last_window_opened = nil
        pw2 = ::Keylogger::PeriodicWindow.new(nil, 1,
                             lambda do |a, b|
                                   unless a.nil?
                                     last_window_title ||= a
                                     last_window_opened ||= Time.now.to_i
                                   end
                                   b
                                 end,
                             lambda do |v|
                                   if last_window_title != v && !last_window_title.nil?
                                     open ("#{@log_tree_path}/active_open_window", 'a') do |f|
                                                    time_difference = (Time.now.to_i - last_window_opened)
                                                    report("window_switch", { :time_difference => time_difference, :window_title => last_window_title[0], :window_details => last_window_title[1]})
                                                    f.puts(CSV.generate do |csv| csv << [time_difference] + last_window_title end )
                                                    last_window_title = nil
                                                    last_window_opened = nil
                                     end
                                   end
                                 end)

        Thread.new do
          while true do
            sleep 1
            app = Application.active
            pw2.enqueue([app.title, app.focused_window.title])
          end
        end
      end

      def applicationDidFinishLaunching (notification)
        log_keys
        log_windows
      end
    end
  end
end
