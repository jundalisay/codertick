class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :hero_image_url
      t.string :short_description      
      t.text :extended_html_description
      t.boolean :published, default: false
      t.references :user, index: true, foreign_key: true
      t.references :venue, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
