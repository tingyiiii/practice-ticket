class Ticket < ApplicationRecord
  belongs_to :user

  before_create :generate_ticket_num

  # validation
  validates :coporation_name, :coporation_phone, presence: true
  validate :validate_coporation_id

  def validate_coporation_id
    id = coporation_id
    at_least_8_digits =  /^\d{8}$/

    if at_least_8_digits.match(id)
      result = []
      serial_array = id.split('')
      num_array = [1, 2, 1, 2, 1, 2, 4, 1]
      serial_array.zip(num_array) { |a, b| result << a.to_i * b }

      sum = 0
      result.each { |elm| 
        sum += elm.divmod(10).inject { |s, i| s + i }
      }
      errors.add(:base, "您所填寫的統⼀編號有誤，請確認後重新輸入") unless (sum % 10 == 0) or (sum % 10 == 9 and serial[5] == '7')
      if ticket = Ticket.find_by(coporation_id: id)
        year = ticket.created_at.strftime("%Y")
        month = ticket.created_at.strftime("%m")
        day = ticket.created_at.strftime("%d")
        errors.add(:base, "您已於 #{year} 年 #{month} ⽉ #{day} ⽇兌換過") 
      end
    elsif id == ""
      errors.add(:coporation_id, "不能為空白")
    else
      errors.add(:base, "您所填寫的統⼀編號有誤，請確認後重新輸入")
    end
  end

  private
  def generate_ticket_num
    self.num = SecureRandom.hex(5)
  end
end
