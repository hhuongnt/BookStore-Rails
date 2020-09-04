json.extract! book, :id, :name, :description, :author, :published_on, :price, :created_at, :updated_at
json.url book_url(book, format: :json)
