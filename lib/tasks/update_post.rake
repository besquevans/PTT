namespace :db do 
  desc "更新文章序號"
  task :update_post_serial => :environment do
    puts "start updating serial"
    Post.where(serial:nil).each do |post|
      post.update(serial: serial_generator(10))
      print '.'
    end
    puts "done!"
  end


  private 

  def serial_generator(n)
    list = [*'A'..'Z', *'a'..'z', *0..9]
    list -= ['i','l','I',1,0,'o']
    list.sample(n).join
  end
end 
