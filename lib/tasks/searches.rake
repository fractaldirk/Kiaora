desc "Remove searches older than two months"
task :remove_old_searches => :environment do
  Search.delete_all ["created_at < ?", 2.months.ago]
end
