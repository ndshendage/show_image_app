json.extract! photo, :id, :tag_line, :created_at, :updated_at
json.url photo_url(photo, format: :json)