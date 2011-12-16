Batcher
======

Processing ActiveRecord data is impossible with large amounts of data because the memory footprint of tons of ActiveRecord objects is too large and unmanagable. ActiveRecord models provide a `find_each` method for batch processing of data; unfortunately it only allows you to slice the data by primary key.

Batcher is a tiny gem that allows you to batch process data and slice it by whatever you require.

Example
-------

```ruby
class User < ActiveRecord::Base
end

Batcher(User.order('influence desc')).each do |user|
  user.do_something
end
```

The deafult batch size is 1000, but you can pass in a different batch size to tweak accordingly:

```ruby
Batcher(User.order('influence desc'), batch_size: 2000).each do |user|
  user.do_something
end
```

License
-------

Batcher is copyright 2011 Harold Gimenez and Stattleship. It is free software, and may be distributed under the terms specified in the LICENSE file.
