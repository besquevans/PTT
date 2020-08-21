class PostMailer < ApplicationMailer
  def poster 
    mail(to: 'du20783@gmail.com', subject: 'test')
  end
end
