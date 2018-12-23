[CartsProduct, Product, Cart, User].map &:delete_all

user = User.create(
  first_name: 'John',
  last_name: 'Smith',
  street_address: 'Aleja Niepodległości 124/5',
  city: 'Warsaw',
  zip_code: '02-605',
  country: 'Poland',
  phone_number: '504 304 245',
  email: 'trzos.tomasz@gmail.com',
  password: 'sample123',
  password_confirmation: 'sample123'
)

product_01 = Product.create(
  name: 'Lightweight down jacket',
  price: 69.99
)

product_02 = Product.create(
  name: 'Double-breasted wool-mix coat',
  price: 79.99
)

product_03 = Product.create(
  name: 'Padded jacket',
  price: 34.99
)

CartsProduct.create(product: product_01, cart: user.cart, amount: 1)
CartsProduct.create(product: product_02, cart: user.cart, amount: 1)
CartsProduct.create(product: product_03, cart: user.cart, amount: 2)
