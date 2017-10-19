json.extract! lecturer, :id, :title, :name, :email, :website, :created_at, :updated_at
json.url lecturer_url(lecturer, format: :json)
