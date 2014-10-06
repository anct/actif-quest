module SpamReportable
  extend ActiveSupport::Concern

  included do
    has_many :spam_reports, as: :spam, dependent: :destroy
    has_many :reporters, through: :spam_reports, class_name: User.name
  end
end
