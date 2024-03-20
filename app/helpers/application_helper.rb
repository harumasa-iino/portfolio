module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type.to_sym
    when :notice
      'alert-success'
    when :alert, :error
      'alert-danger'
    when :warning
      'alert-warning'
    else
      'alert-info'
    end
  end
end
