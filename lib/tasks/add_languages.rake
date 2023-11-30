namespace :db do
    desc "adding five languages to our database"
    task add_languages: :environment do
        language_name = ["Mandarin", "Hindi", "Spanish", "French", "Arabic"]

        language_name.each do |language|
            Language.find_or_create_by(name: language)
            puts "'#{language}' has been added"
        end
        puts "Languages have been sucessfully added"
    end
end