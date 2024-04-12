# ToDo List
- finish formatting dashboard//
- create link for client
- format client pages
- seperate landing and features page
- format show bookings page//
- add inputs to edit profile



- authorizations
- confirmations//
- make sure you cant create a record without all required fields

- STYLE ALL PAGES

- send email after booking
- send email after sign up

## Down the line
- incorporate AI into professional side and client side
- add images to services
- themes
- messages
- notifications
- more analytics
- invoices
- payments
- email marketing
- customer loyalty rewards
- achievements
- goals



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

