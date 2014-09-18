# == Schema Information
#
# Table name: exhibitions
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  introduction :string(255)
#  image_url    :string(255)
#  group_id     :integer
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

names = ['ラビットハウス', '甘兎庵', 'フルール・ド・ラパン']

FactoryGirl.define do
  factory :exhibition do
    sequence(:name) { |n| "#{names[n%names.size]}#{n if n >~ names.size}" }
    introduction 'こころぴょんぴょん待ち？ 考えるふりして もうちょっと近づいちゃえ 簡単には教えないっ こんなに好きなことは内緒なの'
    group { create :group }
  end
end
