# Shoetopia
Shoetopia is a simple web application that uses a MySQL database to store and display information about various shoes. This repository contains the necessary SQL script and Python script to set up the database, populate the webpage, and run the application.

## Getting Started
These instructions will guide you through setting up the project on your local machine for development and testing purposes.

### Prerequisites
Before you can run the Shoetopia application, make sure you have the following software installed on your system:

1. Python 3.6 or later
2. MySQL 5.7 or later 
3. Git (optional)

Additionally, you will need to install the following Python packages:
1. PyMySQL

pip install pymysql

### Clone the Repository
To get a copy of the Shoetopia repository, you can either download it as a zip file or clone it using Git:

git clone https://github.com/jaj180010/Shoetopia.git

### Set Up the Database
Start your MySQL server.
Open your favorite MySQL client (e.g., MySQL Workbench, phpMyAdmin).
Import the Shoetopia.sql script located in the cloned repository. This will create and configure the shoetopia database.

### Configure the Data Generation Script
Open the sqlpy.py file in a text editor and update the following lines with your MySQL server's configuration:

Line 1. app.config['MYSQL_HOST'] = 'your_host'
Line 2. app.config['MYSQL_USER'] = 'your_user'
Line 3. app.config['MYSQL_PASSWORD'] = 'your_password'
Line 4. app.config['MYSQL_DB'] = 'shoetopia'
Replace your_host, your_user, and your_password with the appropriate values for your MySQL server.

### Running the Application
Navigate to the repository folder in a terminal or command prompt and run the following command:

python sqlpy.py
This will start the python script development server. You should see output similar to the following:

* Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
Open your favorite web browser and navigate to the address displayed in the output (e.g., http://127.0.0.1:5000/). You should now see the Shoetopia homepage, displaying the shoe data from the MySQL database.

### Contributing
If you would like to contribute to the Shoetopia project, please feel free to submit a pull request or open an issue on the GitHub repository.

### License
This project is licensed under the MIT License - see the LICENSE file for details.
