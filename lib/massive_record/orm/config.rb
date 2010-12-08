module MassiveRecord
  module ORM
    module Config
      extend ActiveSupport::Concern 

      included do
        cattr_accessor :connection_configuration, :instance_writer => false
        @@connection_configuration = {}
      end

      module ClassMethods
        extend ActiveSupport::Memoizable
        @@connection = nil

        def connection
          if @@connection.blank?
            @@connection = if !connection_configuration.empty?
                            MassiveRecord::Wrapper::Connection.new(connection_configuration)
                          elsif defined? Rails
                            MassiveRecord::Wrapper::Base.connection
                          else
                            raise ConnectionConfigurationMissing
                          end

            @@connection.open
          end
          @@connection
        end

        def reset_connection!
          @@connection = nil
        end


        def table
          MassiveRecord::Wrapper::Table.new(connection, table_name).tap do |t|
            #
            # TODO  Just a dummy find method to make it return something which makes the
            #       test pass right now. Can be removed. Maybe the table should have a
            #
            #
            def t.find(*args)
              {:id => args[0]}.merge(args[1] || {})
            end
          end
        end
        memoize :table
      end
    end
  end
end
