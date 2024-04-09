# Sample Data 
## Users
- first_name: Faker::Name.first_name 
- last_name: Faker::Name.last_name 
- email: first_name.last_name
- password: password
- username: not sure if i need a username
- role: [professional, client]

## Desks
- name: Faker::Company.name
- bio: Faker::Company.catch_phrase
- location: Faker::Address.full_address
- profile_picture: Faker::Company.logo
- professional_id: "user_id.where(role = professional)"

## Categories
- name: [Beauty and Personal Care, Photography and Videography, Design and Creative Services ]
- desk_id: "desk_id"

## Services
- category: category_id
- name: 
### Beauty and Personal Care

* Makeup services
* Hair styling and barber services
* Nail services (manicures, pedicures)
* Skincare services (facials, treatments)
* Massage therapy
* Tattooing and body art

### Photography and Videography

* Portrait photography (individuals, families, pets)
* Event photography and videography (weddings, parties, corporate events)
* Commercial photography and videography (products, advertising)
* Real estate photography and videography
* Aerial/drone photography and videography

### Design and Creative Services
* Graphic design (logos, branding, marketing materials)
* Web design and development
* Interior design
* Fashion design
* Illustration and art commissions

- description: Faker::Company.catch_phrase
- price: [200, 300, 400, 500, 600, 700]
- time_in_minutes: [60, 120, 240]

## Bookings
- desk_id: "desk_id"
- service: "desk.service"
- client_name: user.where(role = client).name 
- email: user.where(role = client).email
- appointment: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
