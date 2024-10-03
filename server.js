const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Connect to MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'najda_new'
});

db.connect(err => {
  if (err) throw err;
  console.log('MySQL Connected...');
});

// CRUD Routes for Houses

// Create a new house
app.post('/houses', (req, res) => {
  const sql = 'INSERT INTO houses SET ?';
  const newHouse = req.body;
  db.query(sql, newHouse, (err, result) => {
    if (err) throw err;
    res.json({ id: result.insertId, ...newHouse });
  });
});

// Get all houses
app.get('/houses', (req, res) => {
  const sql = 'SELECT * FROM houses';
  db.query(sql, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// Update a house
app.put('/houses/:id', (req, res) => {
  const sql = 'UPDATE houses SET ? WHERE id = ?';
  const updateHouse = req.body;
  db.query(sql, [updateHouse, req.params.id], (err, result) => {
    if (err) throw err;
    res.json({ message: 'House updated successfully' });
  });
});

// Delete a house
app.delete('/houses/:id', (req, res) => {
  const sql = 'DELETE FROM houses WHERE id = ?';
  db.query(sql, req.params.id, (err, result) => {
    if (err) throw err;
    res.json({ message: 'House deleted successfully' });
  });
});

// CRUD Routes for Families

// Create a new family
app.post('/families', (req, res) => {
  const sql = 'INSERT INTO families SET ?';
  const newFamily = req.body;
  db.query(sql, newFamily, (err, result) => {
    if (err) throw err;
    res.json({ id: result.insertId, ...newFamily });
  });
});

// Get all families
app.get('/families', (req, res) => {
  const sql = 'SELECT * FROM families';
  db.query(sql, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// Update a family
app.put('/families/:id', (req, res) => {
  const sql = 'UPDATE families SET ? WHERE id = ?';
  const updateFamily = req.body;
  db.query(sql, [updateFamily, req.params.id], (err, result) => {
    if (err) throw err;
    res.json({ message: 'Family updated successfully' });
  });
});

// Delete a family
app.delete('/families/:id', (req, res) => {
  const sql = 'DELETE FROM families WHERE id = ?';
  db.query(sql, req.params.id, (err, result) => {
    if (err) throw err;
    res.json({ message: 'Family deleted successfully' });
  });
});

// CRUD Routes for Individuals

// Create a new individual
app.post('/individuals', (req, res) => {
  const sql = 'INSERT INTO individuals SET ?';
  const newIndividual = req.body;
  db.query(sql, newIndividual, (err, result) => {
    if (err) throw err;
    res.json({ id: result.insertId, ...newIndividual });
  });
});

// Get all individuals
app.get('/individuals', (req, res) => {
  const sql = 'SELECT * FROM individuals';
  db.query(sql, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// Update an individual
app.put('/individuals/:id', (req, res) => {
  const sql = 'UPDATE individuals SET ? WHERE id = ?';
  const updateIndividual = req.body;
  db.query(sql, [updateIndividual, req.params.id], (err, result) => {
    if (err) throw err;
    res.json({ message: 'Individual updated successfully' });
  });
});

// Delete an individual
app.delete('/individuals/:id', (req, res) => {
  const sql = 'DELETE FROM individuals WHERE id = ?';
  db.query(sql, req.params.id, (err, result) => {
    if (err) throw err;
    res.json({ message: 'Individual deleted successfully' });
  });
});

// CRUD Routes for Needs

// Create a new need
app.post('/needs', (req, res) => {
  const sql = 'INSERT INTO needs SET ?';
  const newNeed = req.body;
  db.query(sql, newNeed, (err, result) => {
    if (err) throw err;
    res.json({ id: result.insertId, ...newNeed });
  });
});

// Get all needs
app.get('/needs', (req, res) => {
  const sql = 'SELECT * FROM needs';
  db.query(sql, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// Update a need
app.put('/needs/:id', (req, res) => {
  const sql = 'UPDATE needs SET ? WHERE id = ?';
  const updateNeed = req.body;
  db.query(sql, [updateNeed, req.params.id], (err, result) => {
    if (err) throw err;
    res.json({ message: 'Need updated successfully' });
  });
});

// Delete a need
app.delete('/needs/:id', (req, res) => {
  const sql = 'DELETE FROM needs WHERE id = ?';
  db.query(sql, req.params.id, (err, result) => {
    if (err) throw err;
    res.json({ message: 'Need deleted successfully' });
  });
});

// Start the server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
