# v0.2.0 (git develop)

- references_many.first() will only find first object from DB if proxy has not been loaded, or else return first element in loaded proxy_target.
- Wrapper::Thrift has been moved into Adapter::Thrift. Adding more adapters should be not that hard now.
- References many is now possible. We have to strategies: Store an array of foreign keys in the proxy_owner,
  or supply a ids-starts-with and open up a scanner and read from that point.
- Setting a non-parsable value on date/time field will no longer raise an error.
- Scanner no longer fetches with a limit of 10 by default. It is set to 100000000.
- References one relations support polymorphic relations.
- Simple implementation of references_one relation. This is where you have a foreign key you will look up in a different table.


# v0.1.2 (git master)





# v0.1.1

- A ORM record now now if it is read only or not.
- Added a logger to ORM::Base, which is set to Rails.logger if gem is used with Rails.
- The database cleaner will no longer destroy tables, only delete all of their contents between tests. Speed tests up a lot.
- known_attribute_names are now available as instance method as well.
- If you add a created_at attribute it will be maintained by the ORM with the time the object was created.
- An adapter (wrapper) row now has an updated_at attribute. ORM objects also responds to updated_at
- Bugfix: Database cleaner no longer tries to remove tables with same name twice.



# v0.1.0

- Communication with Hbase via Thrift.
- Basic ORM capabilities.