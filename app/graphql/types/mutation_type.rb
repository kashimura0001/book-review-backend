# frozen_string_literal: true

module Types
  class MutationType < ObjectTypes::BaseObject
    prefix_path = "app/graphql/mutations/"
    Dir.glob("#{prefix_path}*") do |filename|
      filename = filename.gsub(prefix_path, "")
      filename = filename.gsub(".rb", "")

      unless filename == "base_mutation"
        field filename.to_sym, mutation: "Mutations::#{filename.camelize}".constantize
      end
    end
  end
end
