module Mongoid
  module Document
    module Flagable
      def self.included(base)
        base.class_eval do |klass|
          klass.field :flags, type: Array
          klass.index({ flags: 1 }, { background: true })

          include InstanceMethods
          extend  ClassMethods
        end
      end

      module InstanceMethods

        # Adds a flag, and you need to
        # explicitly save the object
        def add_flag(flag)
          (self.flags ||= []) << flag
          self.flags.uniq!
          self.flags
        end

        # Adds a flag, and saves the object
        def add_flag!(flag)
          add_flag(flag)
          save!
          self.flags
        end

        # Checks if a flag exists
        def has_flag?(flag)
          (self.flags || []).include?(flag)
        end

        # Removes a flag, and you need to
        # explicitly save the object
        def remove_flag(flag)
          (self.flags || []).delete_if { |n| n.casecmp(flag) == 0 }
        end

        # Removes a flag, and saves the object
        def remove_flag!(flag)
          remove_flag(flag)
          save!
          self.flags
        end
      end

      module ClassMethods
        def find_by_flags(flags)
          flags = [flags] unless flags.is_a?(Array)
          criteria.in(:flags => flags).to_a
        end
      end
    end
  end
end