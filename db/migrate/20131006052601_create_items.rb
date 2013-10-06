class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user, index: true
      t.references :category, index: true
      t.references :content, index: true
      t.integer :star, default: 0
      t.string :name
      t.date :done_date

      t.timestamps
    end
  end
end
