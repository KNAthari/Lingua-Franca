namespace :db do
    desc "Add backfill role title column in the database"
    task backfill_roles: :environment do
        #role titles
        role_title = ["Student", "Teacher", "Admin"]

        role_title.each do |role|
            Role.find_or_create_by(title: role)
            puts "Role '#{role}' added."
        end

        puts "Roles added successfully"
    end
        
end