# frozen_string_literal: true

class ApplicationContract
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations::Callbacks
end
