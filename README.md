# Booth. CouchDB, swimming a Ruby soup.

## The Test Suite

Booth is an attempt to get the [CouchDB Test Suite]() to pass against an alternate implementation.

This should hella easy because the CouchDB Test Suite just runs in the browser.

## Protocol

We think the CouchDB runtime can be implemented with varying levels of support.

Level 1 would be a basic key value REST API. This is shared in common with a set of existing tools.

Level 2 includes Map Reduce views.

Level 3 is support for replication with CouchDB instances.

Level 4 is support for CouchDB's JavaScript server runtime environment and APIs.

## Booth

Booth is an implementation of CouchDB in Ruby. It's meant as an illustration of CouchDB as a protocol.

Q: CouchDB uses a robust append only B-Tree implementation for storage, what does Booth use for persistence?
A: Nothing. Booth stores data in Ruby hashes and arrays.

Q: Does it scale?
A: Who the fuck cares?

Q: How can I help?
A: Start shouting about Booth on Twitter and I'll probably notice.

Q: Why "Booth"?
A: It's named after [Special Agent Seeley Booth](http://en.wikipedia.org/wiki/Seeley_Booth) from Bones.

## Get Started

Booth is just a Sinatra server, so to start it, run:

    ruby lib/booth.rb

and then visit:

    http://localhost:4567/_utils/couch_tests.html

and run the tests.