class SingleReportRenderer
  def initialize(day:, model:, group:)
    @day = day
    @model = model
    @group = group
  end

  attr_reader :model, :day, :group

  def call
    model.find_or_create_by(day: day,
                            group: group)
  end
end
