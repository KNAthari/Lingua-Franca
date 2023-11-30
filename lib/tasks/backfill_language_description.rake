namespace :db do
    desc "Backfill existing languages with descriptions"
    task :backfill_language_descriptions => :environment do
        description = { 
            "Mandarin" => "Ni Hao! Welcome to our Mandarin language learning community.",
            "Hindi" => "Namaste! Welcome to our Hindi language learning community.",
            "Spanish" => "Hola! Welcome to our Spanish language learning community.",
            "French" => "Bonjour! Welcome to our French language learning community.",
            "Arabic" => "Ahlan wa sahlan! Welcome to our Arabic language learning community."
        }

        Language.where(description: nil).each do |language|
            description = description[language.name]

            language.update!(description: description)
            puts "Description has been filled for '#{language.name}'"
        end

        puts "Backfilling complete"
    end

end