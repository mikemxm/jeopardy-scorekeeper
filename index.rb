#!/usr/bin/ruby

require 'haml'

Haml::Engine.new(File.open("index.html.haml")).render
