json.extract! survey, :id, :url_formula, :name, :created_at, :updated_at
json.url survey_url(survey, format: :json)