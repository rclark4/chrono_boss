class Employee < ActiveRecord::Base
  has_secure_password
  attr_accessible :employee_id, :first_name, :hire_date, :last_name, :email, :password, :password_digest, :password_confirmation, :admin
  # validates :employee_id, :first_name, :last_name #, :sick_days, :vacation_days, :sick_days_used, :vacation_days_used, :presence => true
  has_many :furloughs, :dependent => :destroy

  def years_employed
  	(DateTime.now - hire_date).round / 365
  end

  def newbie
    Time.now.year == hire_date.year
  end

  def vacation_days
    if years_employed < 1 && newbie
      ((12 - hire_date.month) * 0.8).ceil
    elsif years_employed <= 6
      10 
    elsif years_employed <= 16
      years_employed + 4
    else 
      20
    end
  end

  def sick_days
    5.0
  end

  def vacation_days_used # if we need to collect everyone's data, all_employee_durations = Furlough.all.collect(&:vacation_duration)
    self.furloughs.collect(&:vacation_duration).inject(0) { | memo, n | memo + n } 
  end

  def sick_days_used
    self.furloughs.collect(&:sick_duration).inject(0) { | memo, n | memo + n }
  end

  def vacation_days_used_last_year # if we need to collect everyone's data, all_employee_durations = Furlough.all.collect(&:vacation_duration_last_year)
    self.furloughs.collect(&:vacation_duration_last_year).inject(0) { | memo, n | memo + n } 
  end

  def sick_days_used_last_year
    self.furloughs.collect(&:sick_duration_last_year).inject(0) { | memo, n | memo + n }
  end  

  def remaining_vacation_days
    vacation_days + rollover - vacation_days_used
  end

  def remaining_sick_days
    sick_days - sick_days_used
  end

  def remaining_vacation_days_last_year
    vacation_days_last_year - vacation_days_used_last_year
  end

  def remaining_sick_days_last_year
    sick_days_last_year - sick_days_used_last_year
  end

  def vacation_days_last_year
    if years_employed - 1 < 1 && newbie
      ((12 - hire_date.month) * 0.8).ceil
    elsif years_employed - 1 <= 6
      10 
    elsif years_employed - 1 <= 16
      years_employed + 4
    else 
      20
    end
  end

  def rollover
    if newbie
      0
    elsif remaining_vacation_days_last_year >= 2
      2
    elsif remaining_vacation_days <= 0
      0
    else
      remaining_vacation_days_last_year
    end
  end

end