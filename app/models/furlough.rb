class Furlough < ActiveRecord::Base
  attr_accessible :vacation_duration, :sick_duration, :note, :date_from, :date_to, :description, :employee_id, :length_of_day, :approved
  belongs_to :employee
  validates_presence_of :date_from, :date_to, :employee_id, :description, :vacation_duration, :sick_duration
  validate :validate_same_day_half_day #, :validate_date_from_before_date_to, :validate_vacation_cap, :validate_sick_day_cap,
  
  def only_weekdays(range)
    range.select { |d| (1..5).include?(d.wday) }.size    
  end

  def psb_holidays
    Holidays.between(date_from, date_to, :us, :observed).size
  end

  def half
    length_of_day == 'Half'
  end

  def full
    length_of_day == 'Full'
  end
  
  def last_year
    date_from.year == Time.now.year - 1 && date_to.year == Time.now.year - 1
  end

  def this_year
    date_from.year == Time.now.year && date_to.year == Time.now.year
  end

  def history
   Time.now.year - date_from.year  >= 2 &&  Time.now.year - date_to.year >= 2
  end

  def duration
    (only_weekdays(date_from..date_to) - psb_holidays)
  end

  def vacation_duration
    if description == 'Vacation' && half && this_year
      duration * 0.5
    elsif description == 'Vacation' && full && this_year
      duration
    else 
      0.0
    end
  end

  def sick_duration
    if description == 'Sick' && half && this_year
        duration * 0.5
      elsif description == 'Sick' && full && this_year
        duration
      else 
        0.0
    end
  end

  def vacation_duration_last_year
    if description == 'Vacation' && half && last_year
      duration * 0.5
    elsif description == 'Vacation' && full && last_year
      duration
    else 
      0.0
    end
  end

  def sick_duration_last_year
    if description == 'Sick' && half && last_year
        duration * 0.5
      elsif description == 'Sick' && full && last_year
        duration
      else 
        0.0
    end
  end

  def vacation_duration_history
    if description == 'Vacation' && half && history
      duration * 0.5
    elsif description == 'Vacation' && full && history
      duration
    else 
      0.0
    end
  end

  def sick_duration_history
    if description == 'Sick' && half && history
        duration * 0.5
      elsif description == 'Sick' && full && history
        duration
      else 
        0.0
    end
  end

  def duration_aggregate
    vacation_duration + sick_duration + vacation_duration_last_year + sick_duration_last_year + vacation_duration_history + sick_duration_history 
  end

  def vacation_notice
    (date_from - Time.now.day)
  end

  def validate_date_from_before_date_to
    if date_to && date_from
      errors.add(:whoops!, "Be sure the 'From' date is before the 'To' date. Unfortunately, company policy strictly prohibits employees from time-travelling!") if date_to < date_from
    end
  end

  def validate_same_day_half_day
    if date_to > date_from && half
      errors.add(:whoops!, "You have to select 'Full' to do that.")
    end
  end

  def is_approved?
    if approved == true
      "Approved" 
    else 
      "Pending approval"
    end
  end
end

  # def validate_vacation_cap
  #   if employee.remaining_vacation_days - vacation_duration < 0 # && description == 'Vacation'
  #     errors.add(:whoops!, "Scale it back a bit, sport! You don't have that many vacation days left!")
  #   end
  # end

  #   def validate_sick_day_cap
  #   if employee.remaining_sick_days - sick_duration < 0 # && description == 'Sick'
  #     errors.add(:whoops!, "Oh no! You've exceeded your limit for sick days, you poor thing!")
  #   end
  # end