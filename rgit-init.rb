#!/usr/bin/env ruby

# bin/rgit-init

RGIT_DIR=".rgit".freeze
OBJ_DIR = "#{RGIT_DIR}/objects".freeze
REFS_DIR = "#{RGIT_DIR}/refs".freeze

if Dir.exists? RGIT_DIR
  $stderr.puts "Existing RGit Project"
  exit 1
end

def build_objects_directory
  Dir.mkdir OBJ_DIR
  Dir.mkdir "#{OBJ_DIR}/info"
  Dir.mkdir "#{OBJ_DIR}/pack"
end

def build_refs_directory
  Dir.mkdir REFS_DIR
  Dir.mkdir "#{REFS_DIR}/heads"
  Dir.mkdir "#{REFS_DIR}/tags"
end

def initialize_head
  File.open("#{RGIT_DIR}/HEAD", "w") do |file|
    file.puts "ref: refs/heads/master"
  end
end

Dir.mkdir RGIT_DIR
build_objects_directory
build_refs_directory
initialize_head

$stdout.puts "RGit initialized in #{RGIT_DIR}"
