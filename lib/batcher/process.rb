module Batcher
  class Process
    attr_accessor :chunk_size

    def initialize(scope, opts = {})
      @scope      =  scope
      @chunk_size = opts[:chunk_size] || 1000
    end

    def each(&block)
      iterator.each do |object|
        yield object
      end
    end

    def iterator
      Enumerator.new do |yielder|
        offset = 0
        count  = @scope.count
        begin
          @scope.limit(chunk_size).offset(offset).each do |record|
            yielder << record
          end
          offset += chunk_size
        end until (chunk_size + offset - 1) > count
      end
    end
  end
end
