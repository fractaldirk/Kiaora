desc "Manage positions"
task :remove_old_positions => :environment do
  Position.delete_all ["created_at < ?", 2.weeks.ago]
end

task :remove_all_positions => :environment do
  Position.delete_all
end
