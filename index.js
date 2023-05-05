const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(bodyParser.json());
app.use(cors());

const db = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'Humza7865%',
    database: 'Shoetopia',
});

db.connect(err => {
    if (err) throw err;
    console.log('Connected to MySQL database.');
});

app.get('/search', (req, res) => {
    const searchInput = req.query.searchInput;
   const query = `
    SELECT shoetopia.shoe.skey, shoetopia.shoe.Size, shoetopia.shoe.Price, shoetopia.shoe.Color, shoetopia.shoe.Type, shoetopia.shoe.FK_Ckey, shoetopia.shoe_brands.Name
    FROM shoetopia.shoe
    INNER JOIN shoetopia.shoe_brands ON shoetopia.shoe.FK_Bkey = shoetopia.shoe_brands.Bkey
    ORDER BY RAND()
    LIMIT 21
`;


    const searchTerm = '%' + searchInput + '%';
    db.query(query, [searchTerm, searchTerm, searchTerm, searchTerm], (err, result) => {
        if (err) throw err;
        res.json(result);
    });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
