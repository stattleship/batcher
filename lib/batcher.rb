require "batcher/version"
require "batcher/process"

def Batcher(scope, opts = {})
  Batcher::Process.new(scope, opts)
end
