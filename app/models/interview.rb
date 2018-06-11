class Interview < ApplicationRecord
  belongs_to :user

  def initialize(interview_date)
    @interview_date = interview_date
  end

  def change_date
    return @interview_date.strftime("%Y年%m月%d日 %H時%M分")
  end
end
