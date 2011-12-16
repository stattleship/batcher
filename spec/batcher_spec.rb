require 'spec_helper'

class User < ActiveRecord::Base
end

describe Batcher do
  it 'provides an interface to Process' do
    batcher = Batcher(User.where(name: 'foo'))
    batcher.should be_kind_of(Batcher::Process)
  end
end
