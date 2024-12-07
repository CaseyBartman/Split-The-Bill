#Creating users!
user1 = User.create!(name: "Krishna", email: "krishnaemail@gmail.com", password: "123456")
user2 = User.create!(name: "Carter", email: "carteremail@gmail.com", password: "123456")
user3 = User.create!(name: "Jemin", email: "jeminemail@gmail.com", password: "123456")
user4 = User.create!(name: "Casey", email: "caseyemail@gmail.com", password: "123456")

#Creating trips!
trip1 = Trip.create!(
  name: "Bahamas!",
  start_date: Date.new(2024, 12, 1),
  end_date: Date.new(2024, 12, 30)
)

trip2 = Trip.create!(
  name: "Greece",
  start_date: Date.new(2024, 12, 1),
  end_date: Date.new(2025, 1, 6)
)

#Making our participants
Participant.create!(trip: trip1, user: user1)
Participant.create!(trip: trip1, user: user2)
Participant.create!(trip: trip1, user: user3)
Participant.create!(trip: trip1, user: user4)
Participant.create!(trip: trip2, user: user1)
Participant.create!(trip: trip2, user: user3)
Participant.create!(trip: trip2, user: user4)

#Making some expenses!
expense1 = Expense.create!(
  trip: trip1,
  name: "1st Dinner",
  expense_type: "Food",
  amount: 40.00,
  payer: user2,
  date: Date.new(2024, 12, 2)
)

expense2 = Expense.create!(
  trip: trip1,
  name: "Air BNB Bill",
  expense_type: "Lodging",
  amount: 400.00,
  payer: user3,
  date: Date.new(2024, 12, 3)
)

expense3 = Expense.create!(
  trip: trip1,
  name: "Gas Money to Airport",
  expense_type: "Gas",
  amount: 80.00,
  payer: user4,
  date: Date.new(2024, 12, 5)
)

expense4 = Expense.create!(
  trip: trip1,
  name: "Hotel",
  expense_type: "Lodging",
  amount: 160.00,
  payer: user4,
  date: Date.new(2024, 12, 17)
)

# Contributions for trip1 expenses
Contribution.create!(expense: expense1, user: user1, amount: 10.00, paid: true)
Contribution.create!(expense: expense1, user: user2, amount: 10.00, paid: true)
Contribution.create!(expense: expense1, user: user3, amount: 10.00, paid: true)
Contribution.create!(expense: expense1, user: user4, amount: 10.00, paid: true)

Contribution.create!(expense: expense2, user: user1, amount: 100.00, paid: true)
Contribution.create!(expense: expense2, user: user2, amount: 200.00, paid: false)
Contribution.create!(expense: expense2, user: user3, amount: 50.00, paid: true)
Contribution.create!(expense: expense2, user: user4, amount: 50.00, paid: false)

Contribution.create!(expense: expense3, user: user1, amount: 20.00, paid: true)
Contribution.create!(expense: expense3, user: user2, amount: 20.00, paid: false)
Contribution.create!(expense: expense3, user: user3, amount: 30.00, paid: true)
Contribution.create!(expense: expense3, user: user4, amount: 10.00, paid: true)

Contribution.create!(expense: expense4, user: user1, amount: 40.00, paid: true)
Contribution.create!(expense: expense4, user: user2, amount: 40.00, paid: false)
Contribution.create!(expense: expense4, user: user3, amount: 40.00, paid: false)
Contribution.create!(expense: expense4, user: user4, amount: 40.00, paid: true)



#Now, sample expenses for trip2!
expense5 = Expense.create!(
  trip: trip2,
  name: "Pizza",
  expense_type: "Food",
  amount: 30.00,
  payer: user1,
  date: Date.new(2024, 12, 6)
)

expense6 = Expense.create!(
  trip: trip2,
  name: "Hostel Price",
  expense_type: "Lodging",
  amount: 300.00,
  payer: user3,
  date: Date.new(2024, 12, 8)
)


# Contributions for trip2 expenses
Contribution.create!(expense: expense5, user: user1, amount: 10.00, paid: true)
Contribution.create!(expense: expense5, user: user3, amount: 10.00, paid: false)
Contribution.create!(expense: expense5, user: user4, amount: 10.00, paid: true)

Contribution.create!(expense: expense6, user: user1, amount: 100.00, paid: true)
Contribution.create!(expense: expense6, user: user3, amount: 100.00, paid: true)
Contribution.create!(expense: expense6, user: user4, amount: 100.00, paid: false)