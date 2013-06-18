class Search < ActiveRecord::Base
  attr_accessible :department, :keywords, :max_update, :min_update, :office_id

  def positions
    @positions ||= find_positions
  end

private

  def find_positions
    positions = Position.order(:job_title)
    positions = Position.where("job_title ilike ?", "%#{keywords}%") if keywords.present?
    positions = Position.where(office: office_id) if office_id.present?
    # department code goes here, example: positions = Position.where(department: department) if department.present?
    # works if department is a select box and id field (collection_select) + define model (just like define model for office)
    positions = Position.where("updated_at >= ?", min_update) if min_update.present?
    positions = Position.where("updated_at <= ?", max_update) if max_update.present?
    positions
  end
end
