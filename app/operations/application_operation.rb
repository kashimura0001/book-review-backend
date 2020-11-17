class ApplicationOperation
  ERROR_CONTRACT_VALIDATION = :error_contract_validation

  attr_reader :contract
  attr_reader :error

  delegate :valid?, to: :contract

  def initialize
    raise NotImplementedError
  end

  def call
    raise NotImplementedError
  end
end
