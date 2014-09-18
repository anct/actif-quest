# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

names = (1..3).map { |g| %w(M E C A).map { |d| "#{g}#{d}" } }.flatten
names = ['Web製作研究部', '情報工学研究部', 'GCC', '視覚メディア研究部', 'ロボット工学研究部', *names]

FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "#{names[n%names.size]}#{n if n >= names.size}" }
  end
end
