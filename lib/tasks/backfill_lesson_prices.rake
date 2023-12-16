namespace :backfill_lesson_prices do
    desc 'Backfill lesson prices where price is null'
    task lesson_prices: :environment do
    default_price = 20.0

    lessons_with_null_prices = Lesson.where(price: nil)

    puts "Updating #{lessons_with_null_prices.count} lessons with null prices..."

    lessons_with_null_prices.update_all(price: default_price)

    puts 'Done!'
  end
end
