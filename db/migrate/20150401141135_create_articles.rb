class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :subtitle
      t.text :content
      t.boolean :published, {default: true}
      t.date :published_on, {default: Date.today()}
      t.timestamps
    end
  end
end
