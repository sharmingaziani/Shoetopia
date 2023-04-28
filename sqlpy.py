import pymysql
import random
from faker import Faker

fake = Faker()

# Your MySQL connection details
host = '127.0.0.1'
user = 'root'
password = 'Your password here'
db_name = 'ShoeTopia'

# Connect to the MySQL database
connection = pymysql.connect(host=host, user=user, password=password, database=db_name)
cursor = connection.cursor()

# Fetch existing keys from the database
cursor.execute("SELECT BKey FROM Shoe_Brands")
brand_keys = [row[0] for row in cursor.fetchall()]

cursor.execute("SELECT CKEY FROM Customers")
customer_keys = [row[0] for row in cursor.fetchall()]

num_entries = 200

# Generate data for each table

# Shoe_Brands table
num_brands = 200
max_brand_name_length = 30  # Replace 30 with the actual maximum length of the 'Name' column

for _ in range(num_brands):
    brand_name = fake.company()[:max_brand_name_length]
    cursor.execute("INSERT INTO Shoe_Brands (Name) VALUES (%s)", (brand_name,))

# Fetch existing keys from the database after inserting new records
cursor.execute("SELECT BKey FROM Shoe_Brands")
brand_keys = [row[0] for row in cursor.fetchall()]

# Customers table
num_customers = 200
max_phone_length = 12
max_name_length = 40
max_gender_length = 10
max_address_length = 80

for _ in range(num_customers):
    customer_name = fake.name()[:max_name_length]
    gender = random.choice(["Male", "Female", "Other"])[:max_gender_length]
    address = fake.address()[:max_address_length]
    phone = fake.phone_number()[:max_phone_length]
    cursor.execute("INSERT INTO Customers (Name, Gender, Address, Phone) VALUES (%s, %s, %s, %s)", (customer_name, gender, address, phone))

# Fetch existing keys from the database
cursor.execute("SELECT CKEY FROM Customers")
customer_keys = [row[0] for row in cursor.fetchall()]

#Shoe
for _ in range(num_entries):
    # Insert data into Shoe table
    size = random.randint(1, 20)
    price = random.randint(10, 300)
    color = fake.color_name()
    shoe_type = random.choice(["Basketball", "Casual", "Cleats", "Running"])
    fk_ckey = random.choice(customer_keys)
    fk_bkey = random.choice(brand_keys)
    cursor.execute("INSERT INTO Shoe (Size, Price, Color, Type, FK_CKey, FK_BKey) VALUES (%s, %s, %s, %s, %s, %s)", (size, price, color, shoe_type, fk_ckey, fk_bkey))

    # Get the last inserted SKey
    fk_skey = cursor.lastrowid

    if shoe_type == "Basketball":
        support = random.randint(1, 100)
        cursor.execute("INSERT INTO Basketball_Shoes (Support, FK_SKey) VALUES (%s, %s)", (support, fk_skey))

    # Insert data into Casual_Shoes table if the shoe type is Casual
    if shoe_type == "Casual":
        comfort = random.randint(1, 100)
        cursor.execute("INSERT INTO Casual_Shoes (Materials, FK_SKey) VALUES (%s, %s)", (comfort, fk_skey))

    if shoe_type == "Cleats":
        traction = random.randint(1, 100)
        cursor.execute("INSERT INTO Cleats (Sport_Type, FK_SKey) VALUES (%s, %s)", (traction, fk_skey))

    if shoe_type == "Running":
        speed = random.randint(1, 100)
        cursor.execute("INSERT INTO Running_Shoes (Breathability, FK_SKey) VALUES (%s, %s)", (speed, fk_skey))

# Walmart table
num_walmart = 70

for _ in range(num_walmart):
    convenience = random.choice([True, False])
    cursor.execute("SELECT StoreID FROM Retail_Stores")
    store_ids = [row[0] for row in cursor.fetchall()]
    if store_ids:  # Check if store_ids list is not empty
        fk_storeid = random.choice(store_ids)
        cursor.execute("INSERT INTO Walmart (Convenience, FK_StoreID) VALUES (%s, %s)", (convenience, fk_storeid))

# FootLocker table
num_footlocker = 60

for _ in range(num_footlocker):
    wide_variety = random.randint(1, 100)
    cursor.execute("SELECT StoreID FROM Retail_Stores")
    store_ids = [row[0] for row in cursor.fetchall()]
    if store_ids:  # Check if store_ids list is not empty
        fk_storeid = random.choice(store_ids)
        cursor.execute("INSERT INTO FootLocker (Wide_Variety, FK_StoreID) VALUES (%s, %s)", (wide_variety, fk_storeid))


# Commit the changes and close the connection
connection.commit()
cursor.close()
connection.close()
