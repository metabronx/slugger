Slugger
=======

Super simple slugger Rails plugin.

Installation
============

    script/plugin install git://github.com/sdbase/slugger.git

Example
=======

By default Slugger expects the model to have a 'title' and 'slug' column.

    class Awesome < ActiveRecord::Base
      slug
    end

    a = Awesome.new
    a.title = "My Awesome Title"
    a.valid?  # => true
    a.slug    # => "my-awesome-title"

But custom column names can be used:

    class Awesomer < ActiveRecord::Base
      slug :name, :as => :path
    end

    ar  = Awesomer.new
    ar.title = "My Awesomer Name"
    ar.valid?  # => true
    ar.path    # => "my-awesomer-name"


Credits
=======

Cubicphuse's to_slug http://github.com/ludo/to_slug for the String#to_slug method

Copyright (c) 2009 sdbase, released under the MIT license
