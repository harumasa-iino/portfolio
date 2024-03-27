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

  def default_meta_tags
    {
      site: 'Select Frame',
      og: defalut_og,
#      twitter: default_twitter_card
    }
  end
  
  private
  
  def defalut_og
    {
      title: :full_title,
      description: :description,
      url: request.url,
#      image: 'https://example.com/hoge.png'
    }
  end
  
#  def default_twitter_card
#    {
#      card: 'summary_large_image',
#      site: '@hogehoge'            # twitter ID
#    }
#  end
end
