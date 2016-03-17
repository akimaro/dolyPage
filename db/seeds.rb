# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#ActiveRecord::Base.connection.execute("BEGIN TRANSACTION; END;")

list = Array.new
list << Project.new(year:2015,
                    name:"橙色の屋根のお家：発達障害を持つ子ども向けのデジタルプレイセラピーの提案",
                    filename:"house_of_orangeroof.pdf",
                    researcher:"渡辺柚佳子、樫村健人、岡田佳子、大澤博隆、菅谷みどり",
                    imgfilename:"house_of_orangeroof.jpg")

list << Project.new(year:2015,
                    name:"Haptic Virtual Approach: 触覚・仮想アプローチおよび効果測定手法の検討プレイセラピーの提案",
                    filename:"HapticVirtualApproach.pdf",
                    researcher:"保科篤志",
                    imgfilename:"")

list << Project.new(year:2015,
                    name:"発達障害児童向けのデジタルセラピーデバイス",
                    filename:"therapyDevice.pdf",
                    researcher:"",
                    imgfilename:"")

list.each do |pj|
  puts pj
  pj.save
end

