module HomeHelper
  def user_office
    current_user.office
  end
  def aweekago
    a = Activity.find(:all, :conditions => ["created_at > ? AND office = ?", 1.week.ago, user_office]).count.to_i
    b = Activity.find(:all, :conditions => ["created_at > ? AND office = ?", 6.days.ago, user_office]).count.to_i
    abtotal = a - b
    [abtotal]
  end

  def sixdaysago
    a = Activity.find(:all, :conditions => ["created_at > ? AND office = ?", 6.days.ago, user_office]).count.to_i
    b = Activity.find(:all, :conditions => ["created_at > ? AND office = ?", 5.days.ago, user_office]).count.to_i
    abtotal = a - b
    [abtotal]
  end

  def fivedaysago
    a = Activity.find(:all, :conditions => ["created_at > ? AND office = ?", 5.days.ago, user_office]).count.to_i
    b = Activity.find(:all, :conditions => ["created_at > ? AND office = ?", 4.days.ago, user_office]).count.to_i
    abtotal = a - b
    [abtotal]
  end

  def fourdaysago
    a = Activity.find(:all, :conditions => ["created_at > ? AND office = ?", 4.days.ago, user_office]).count.to_i
    b = Activity.find(:all, :conditions => ["created_at > ? AND office = ?", 3.days.ago, user_office]).count.to_i
    abtotal = a - b
    [abtotal]
  end

  def threedaysago
    a = Activity.find(:all, :conditions => ["created_at > ? AND office = ?", 3.days.ago, user_office]).count.to_i
    b = Activity.find(:all, :conditions => ["created_at > ? AND office = ?", 48.hours.ago, user_office]).count.to_i
    abtotal = a - b
    [abtotal]
  end

  def twodaysago
    a = Activity.find(:all, :conditions => ["created_at > ? AND office = ?", 48.hours.ago, user_office]).count.to_i
    b = Activity.find(:all, :conditions => ["created_at > ? AND office = ?", 24.hours.ago, user_office]).count.to_i
    abtotal = a - b
    [abtotal]
  end

  def adayago
    abtotal = Activity.find(:all, :conditions => ["created_at > ? AND office = ?", 24.hours.ago, user_office]).count.to_i
    [abtotal]
  end
end
