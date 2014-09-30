# == Schema Information
#
# Table name: spam_reports
#
#  id          :integer          not null, primary key
#  reporter_id :integer
#  spam_id     :integer
#  spam_type   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spam_report do
    reporter_id 1
    spam_id 1
    spam_type "MyString"
  end
end
