class UserMailer < ActionMailer::Base
  default from: "reachout@example.com"

  def welcome_email(tenant)
    @tenant = tenant
    @url = 'http://example.com/login'
    mail(to: @tenant.email, subject: 'Welcome to my landlord-tenant connection site')
  end

  def notice_email(tenant, notice)
  	@tenant = tenant
  	@notice = notice
  	@url = 'phillslife.com'
  	mail(to: @tenant.email, subject: 'Reach Out Notification')
  end

end
