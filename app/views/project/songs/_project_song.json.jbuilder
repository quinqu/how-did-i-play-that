json.extract! project_song, :id, :name, :content, :tag, :project_id, :created_at, :updated_at
json.url project_song_url(project_song, format: :json)
