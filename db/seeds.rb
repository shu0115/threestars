# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.where(name: '本').first_or_create
Category.where(name: '映画').first_or_create
Category.where(name: 'ゲーム').first_or_create
Category.where(name: 'アニメ').first_or_create
Category.where(name: '音楽').first_or_create
Category.where(name: 'その他').first_or_create
