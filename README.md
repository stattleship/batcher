Batcher
======

Batcher is a tiny gem that allows you to batch process data and slice it by whatever you require.

Why
---

Processing ActiveRecord data is impossible with large amounts of data because the memory footprint of tons of ActiveRecord objects is too large and unmanagable. ActiveRecord models provide a `find_each` method for batch processing of data; unfortunately it only allows you to slice the data by primary key.

Example
-------

Batcher accepts an object that responds to `limit` and `offset` (a subset of the [Active Record Query Interface](http://guides.rubyonrails.org/active_record_querying.html)). Typically, you pass it an instance of `ActiveRecord::Relation`.

    class User < ActiveRecord::Base
    end

    Batcher(User.order('influence desc')).each do |user|
      user.do_something
    end

The default batch size is 1000, but you can pass in a different batch size to tweak accordingly:

    Batcher(User.order('influence desc'), batch_size: 2000).each do |user|
      user.do_something
    end

License
-------

Batcher is Copyright 2011 Harold Gimenez and Stattleship. It is free software, and may be distributed under the terms specified in the LICENSE file.
