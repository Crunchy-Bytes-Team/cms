module Cms
  module UserRoles
    extend ActiveSupport::Concern

    included do

      #ROLES HELPERS
      ROLES = %w[guest user administrator]

      def role_name
        if self.role == 10
          "superadmin"
        else
          Cms::User.roles[self.role]
        end
      end

      def self.role_name(role)
        if role == 10
          "superadmin"
        else
          Cms::User.roles[role]
        end
      end

      def self.roles
        ROLES.map{|r| r.to_sym}
      end

      def self.roles_list
        ROLES.each_with_index.map{|r,i| [r.to_sym,i.to_s]}
      end

      def has_role?(_role)
        _role = _role.to_sym
        ((Cms::User.roles.include? _role) && (self.role.to_i >= Cms::User.roles.index(_role)))
      end

      def superadmin?
        self.role.to_i == 10
      end

    end
  end
end
