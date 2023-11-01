Supplier.create!([
  { name: "A24", email: "a24@test.com", phone_number: "987-766-4657" },
  { name: "Disney", email: "disney@test.com", phone_number: "987-766-4657" },
  { name: "Warner Bros", email: "wbros@test.com", phone_number: "976-354-8224" },
])
Product.create!([
  { name: "The Conjuring", price: "25.0", image_url: nil, description: "Paranormal investigators Ed and Lorraine Warren work to help a family terrorized by a dark presence in their farmhouse.", inventory: 35, supplier_id: 1 },
  { name: "Inside Out", price: "15.0", image_url: nil, description: "After young Riley is uprooted from her Midwest life and moved to San Francisco, her emotions - Joy, Fear, Anger, Disgust, and Sadness - conflict on how best to navigate a new city, house, and school.", inventory: 64, supplier_id: 2 },
  { name: "Lord of the Rings, the Fellowship of the Ring", price: "20.0", image_url: nil, description: "A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.", inventory: 10, supplier_id: 3 },
  { name: "Lord of the Rings, the Two Towers", price: "22.0", image_url: nil, description: "While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron's new ally, Saruman, and his hordes of Isengard.", inventory: 23, supplier_id: 3 },
  { name: "Lord of the Rings, the Return of the King", price: "21.0", image_url: nil, description: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.", inventory: 43, supplier_id: 3 },
])
Image.create!([
  { url: "https://m.media-amazon.com/images/M/MV5BMTM3NjA1NDMyMV5BMl5BanBnXkFtZTcwMDQzNDMzOQ@@._V1_.jpg", product_id: 4 },
  { url: "https://imageio.forbes.com/blogs-images/jvchamary/files/2015/08/Inside-Out-First-Look-RGB-d150_20mpub.pub16.101-1940x1091.jpg", product_id: 5 },
  { url: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg", product_id: 1 },
  { url: "https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX67_CR0,0,67,98_AL_.jpg", product_id: 2 },
  { url: "https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX67_CR0,0,67,98_AL_.jpg", product_id: 3 },
  { url: "https://m.media-amazon.com/images/M/MV5BMTI5MDg3MzU1MV5BMl5BanBnXkFtZTcwODk2MTk2Mw@@._V1_UY100_CR37,0,100,100_AL_.jpg", product_id: 5 },
])
