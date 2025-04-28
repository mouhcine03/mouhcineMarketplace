module AnouncesHelper
  def anounce_status_badge_class(status)
    case status.to_s
    when 'draft'
      'badge-secondary'
    when 'published'
      'badge-success'
    when 'sold'
      'badge-primary'
    when 'archived'
      'badge-danger'
    else
      'badge-secondary'
    end
  end
end