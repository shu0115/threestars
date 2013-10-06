class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
    Category.where(name: '本').first_or_create
    Category.where(name: '映画').first_or_create
    Category.where(name: 'ゲーム').first_or_create
    Category.where(name: 'アニメ').first_or_create
    Category.where(name: '音楽').first_or_create
  end
end
