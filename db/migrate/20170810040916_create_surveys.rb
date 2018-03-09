class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :url_formula
      t.string :name

      t.timestamps null: false
    end
  end
end
