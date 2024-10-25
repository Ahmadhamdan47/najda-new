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
// Create a new individual
app.post('/individuals', (req, res) => {
  const { name, type, house_id, family_id } = req.body;
  const sql = 'INSERT INTO individuals SET ?';
  const newIndividual = { name, type, house_id, family_id };
  db.query(sql, newIndividual, (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ id: result.insertId, ...newIndividual });
  });
});

// Update an individual
app.put('/individuals/:id', (req, res) => {
  const { name, type, house_id, family_id } = req.body;
  const sql = 'UPDATE individuals SET ? WHERE id = ?';
  const updateData = { name, type, house_id, family_id };
  db.query(sql, [updateData, req.params.id], (err) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Individual updated successfully' });
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
// Create a new need
app.post('/needs', (req, res) => {
  const sql = 'INSERT INTO needs SET ?';
  const newNeed = { ...req.body, fulfilled: req.body.fulfilled || 0 }; // Add fulfilled status, default to 0
  db.query(sql, newNeed, (err, result) => {
    if (err) throw err;
    res.json({ id: result.insertId, ...newNeed });
  });
});


// Get all needs
// GET all needs
app.get('/needs', (req, res) => {
  const sql = 'SELECT id, food_aid, medicine, furniture, clothes, cleaning_supplies, house_id, family_id, individual_id, fulfilled, fulfilled_date FROM needs';
  db.query(sql, (err, results) => {
    if (err) {
      console.error('Error fetching needs:', err);
      return res.status(500).json({ error: 'Failed to fetch needs' });
    }
    res.json(results);
  });
});


// Update a need
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
// Mark a need as fulfilled/unfulfilled
// PATCH endpoint for fulfilling a need
app.patch('/needs/:id/fulfill', (req, res) => {
  const { id } = req.params;
  const { fulfilled } = req.body;
  
  // Set the fulfilled_date to the current timestamp if fulfilled, otherwise set it to NULL
  const fulfilledDate = fulfilled ? new Date() : null;
  
  const sql = 'UPDATE needs SET fulfilled = ?, fulfilled_date = ? WHERE id = ?';
  db.query(sql, [fulfilled, fulfilledDate, id], (err, result) => {
    if (err) {
      console.error('Error updating need:', err);
      return res.status(500).json({ error: 'Failed to update need' });
    }
    res.json({ message: 'Need updated successfully' });
  });
});

// Get needs by fulfillment status
app.get('/needs/fulfilled/:status', (req, res) => {
  const sql = 'SELECT * FROM needs WHERE fulfilled = ?';
  const status = req.params.status === '1' ? 1 : 0;
  db.query(sql, status, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// Start the server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
