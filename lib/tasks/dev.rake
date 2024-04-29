unless Rails.env.production?
  namespace :dev do
    desc "Drops, creates, migrates, and adds sample data to database"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "dev:sample_data"
    ]

    desc "Adds sample data for development environment"
    task sample_data: [
      :environment,
      "add_specific_users",
      "dev:add_availabilities",
      "dev:add_bookings"
    ] do
      puts "done adding sample data"
    end

    
    task add_availabilities: :environment do
      puts "adding availabilities..."
      Desk.all.each do |desk|
        ['Monday', 'Wednesday', 'Friday'].each do |day|
          Availability.create(
            desk_id: desk.id,
            day_of_the_week: day,
            start_time: Time.parse("09:00"),
            end_time: Time.parse("17:00")
          )
        end
      end
      puts "done"
    end

    task add_bookings: :environment do
      puts "adding bookings..."
      Service.all.each do |service|
        5.times do
          availability = service.category.desk.availability.sample
          appointment_time = Faker::Time.between_dates(from: Date.today, to: Date.today + 30, period: :day)
                     .change(hour: rand(9..16))

          Booking.create(
            desk_id: service.category.desk_id,
            service_id: service.id,
            client_name: Faker::Name.name,
            client_email: Faker::Internet.email,
            appointment: appointment_time,
            status: ["pending", "confirmed", "completed"].sample
          )
        end
      end
      puts "done"
    end
    task add_specific_users: :environment do
      professions = [
        {email: "photographer@example.com",
         username: "photographer",
         profession: "Photographer",
         first_name: "Alex",
         last_name: "Reed", 
         profile_picture: "https://www.brandignity.com/wp-content/uploads/2020/12/digital-marketing-photography.jpg",
         desk_name: "ReedCaptures",
         bio: "Alex Reed is a New York-based photographer specializing in wedding, portrait, and event photography. With over a decade of experience, he combines technical skill with artistic flair to capture meaningful and enduring images."
        },
        
        {email: "makeupartist@example.com", 
        username: "makeupartist", 
        profession: "Makeup Artist", 
        first_name: "Maria", 
        last_name: "Lopez", 
        profile_picture: "https://www.mbmmakeupstudio.com/wp-content/uploads/2021/04/Natural-Makeup-Look-1.jpg",
        desk_name: "MLStudio",
        bio: "Maria Lopez is a Los Angeles-based makeup artist known for her expertise in bridal and special event makeup. Her work emphasizes natural beauty and has been featured in various media outlets."},
        
        {email: "barber@example.com", 
        username: "barber", 
        profession: "Barber", 
        first_name: "Jamal", 
        last_name: "Carter", 
        profile_picture: "https://as1.ftcdn.net/v2/jpg/02/05/49/82/1000_F_205498258_AfQmtyR5kO5llwKd6fWRRxcc4xRUbQcb.jpg",
        desk_name: "CarterShop",
        bio: "Jamal Carter is a respected barber in Chicago, known for precision cuts and a welcoming shop atmosphere. His barbershop, Carter's Barbershop, offers a full range of grooming services, focusing on tailored experiences."}
      ]
  
      professions.each do |prof|
        user = User.create!(
          email: prof[:email],
          username: prof[:username],
          password: "password",
          role: "professional",
          first_name: prof[:first_name],
          last_name: prof[:last_name]
        )
        
        desk = Desk.create!(
          name: prof[:desk_name],
          bio:  prof[:bio],
          location: "Downtown Studio",
          profile_picture: prof[:profile_picture],
          professional_id: user.id
        )
  
        case prof[:profession]
        when "Photographer"
          categories = ["Weddings", "Portraits", "Events"]
          services = [
            {name: "Wedding Photography", description: "Capture your special day with stunning photos.", price: 1200},
            {name: "Portrait Session", description: "Professional studio portraits.", price: 300}
          ]
        when "Makeup Artist"
          categories = ["Bridal Makeup", "TV and Film", "Special Occasions"]
          services = [
            {name: "Bridal Makeup", description: "Beautiful makeup for your wedding day.", price: 250},
            {name: "TV Makeup", description: "Makeup services for TV appearances.", price: 500}
          ]
        when "Barber"
          categories = ["Haircuts", "Shaves", "Styling"]
          services = [
            {name: "Standard Haircut", description: "A quick, stylish cut.", price: 30},
            {name: "Beard Trim", description: "Clean and precise beard shaping.", price: 20}
          ]
        end
  
        categories.each do |cat_name|
          category = Category.create!(
            name: cat_name,
            desk_id: desk.id
          )
  
          services.each do |serv|
            Service.create!(
              name: serv[:name],
              description: serv[:description],
              price: serv[:price],
              time_in_minutes: 60, # Assuming all services take roughly an hour
              category_id: category.id
            )
          end
        end
      end
  
      puts "Professionals and their services have been added successfully."
    end
  end
end
