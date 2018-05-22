module ApplicationHelper
  def default_meta_tags
    {
      site: 'tips_room_js',
      reverse: true,
      title: 'tips_room_js',
      description: 'あの処理JavaScriptで書く時どうするんだっけ？を解決するJavaScriptのtips',
      keywords: ['JavaScript', 'JS', 'js', 'jQuery', 'tips', 'tips_room_js'],
      canonical: request.original_url,
      og: {
        title: :title,
        type: nil,
        url: request.original_url,
        image: image_url(''),
        site_name: :site,
        description: :description,
        locale: 'ja_JP'
      }
    }
  end
end
