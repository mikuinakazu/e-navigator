class Interview < ApplicationRecord
  belongs_to :user

  def interview_date_str
    return interview_date.strftime("%Y年%m月%d日 %H時%M分")
  end
end
