# Period - start_at, end_at
# start_at = obrigatorio
# end_at = opcional

class Period
  attr_reader :start_at, :end_at

  def initialize(start_at:, end_at: nil)
    @start_at = start_at
    @end_at = end_at
  end

  def opened?
    @end_at.blank?
  end

  def days
    return nil if end_at.blank?
    (end_at - start_at).to_i + 1
  end
end
