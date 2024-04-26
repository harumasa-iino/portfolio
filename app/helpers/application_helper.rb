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
      site: 'Frame Select',
      title: 'Frame Select',
      reverse: true,
      description: 'このアプリは、お部屋のインテリアにぴったりなポスターや絵画を見つけるお手伝いをします。
      独自のマッチングシステムを用いて空間に合わせたアート作品を提案することで、統一感のある理想の部屋作りをサポート。ポスターであなたの部屋をもっとおしゃれな空間に変えてみませんか？',
      og: defalut_og,
      twitter: default_twitter_card
    }
  end
  
  private
  
  def defalut_og
    {
      site_name: :site,
      title: :title,
      description: :description,
      type: 'website',
      url: request.original_url,
      image: image_url('ogp.png'), # 配置するパスやファイル名によって変更すること
      local: 'ja-JP'
    }
  end
  
  def default_twitter_card
    {
      card: 'summary_large_image',
#     site: '@hogehoge'            # twitter ID
      image: image_url('ogp.png')
    }
  end
end
