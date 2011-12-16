module Batcher
  class Process
    attr_accessor :batch_size

    def initialize(scope, opts = {})
      @scope      =  scope
      @batch_size = opts[:batch_size] || 1000
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
          @scope.limit(batch_size).offset(offset).each do |record|
            yielder << record
          end
          offset += batch_size
        end until (batch_size + offset - 1) > count
      end
    end
  end
end
