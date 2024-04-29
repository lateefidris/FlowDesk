# ToDo List
- finish formatting dashboard//
- create link for client//
- format client pages//
- format show bookings page//
- add inputs to edit profile//
- edit categories//
- create landing page
- STYLE ALL PAGES[service.show, service.form, category.form, bookings.index, bookings.show, desk.edit]
- notification button
- delete unusused routes with except: [:edit, :new]
- conditional redirects 
- hide json


- authorizations/pundit
- pagination
- confirmations//
- make sure you cant create a record without all required fields//


- send email after booking
- send email after sign up
- if you have multiple bookings on the same day in the dashboard it will play each one for 4 seconds and fade to next

## Down the line
- private users
- patch and hole availabilty for updating record
- incorporate AI into professional side and client side
- add images to services//
- themes
- messages
- notifications
- more analytics
- invoices
- payments
- email marketing
- customer loyalty rewards
- achievements**
- goals**
- store policies
- service request

- oauth
- seo
- metatags
- "webhook"


<h1>
  <% total_revenue = 0 %>
    <% current_user.desks.bookings.each do |booking| %>
      <% booking.service.each do |service| %>
        <% if service.completed? %>
          <% total_revenue += service.price %>
        <% end %>
      <% end %>
    <% end %>
  <%= number_to_currency(total_revenue) %> 
</h1>
