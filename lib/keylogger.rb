framework 'Cocoa'
framework "Carbon"
framework "ApplicationServices"
framework "AppKit"

require "keylogger/version"
require "keylogger/periodic_window"
require "keylogger/osx/application"
require "keylogger/osx/window"
require "keylogger/osx/app_delegate"
require 'eventoverse'

module Keylogger
  def self.run!(path)
    Eventoverse.configure!({
        :host => "127.0.0.1",
        :application_name => "personal_analytics",
        :env => "local",
        :udp => {:port => 3333}})
    Eventoverse.set_reporter!(Eventoverse.udp)
    NSApplication.sharedApplication.delegate = Keylogger::OSX::AppDelegate.new(path)
    NSApplication.sharedApplication.run
    Keylogger::LocalhostSpy.run!
  end
end
