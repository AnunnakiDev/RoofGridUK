const express = require('express');
const router = express.Router();
const pool = require('../db');

// Get all tiles (for pro users)
router.get('/', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM tiles');
    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching tiles:', err);
    res.status(500).json({ message: 'Server error' });
  }
});

// Add a new tile (admin only)
router.post('/', async (req, res) => {
  const { name, type, length, width, eave_tile_length, headlap, crossBonded, minGauge, maxGauge, minSpacing, maxSpacing, datasheet_link } = req.body;
  try {
    const result = await pool.query(
      'INSERT INTO tiles (name, type, length, width, eave_tile_length, headlap, crossBonded, minGauge, maxGauge, minSpacing, maxSpacing, datasheet_link) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12) RETURNING *',
      [name, type, length, width, eave_tile_length, headlap, crossBonded, minGauge || 75, maxGauge || 325, minSpacing || 3, maxSpacing || 7, datasheet_link]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error('Error adding tile:', err);
    res.status(500).json({ message: 'Server error' });
  }
});

// Update a tile (admin only)
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { name, type, length, width, eave_tile_length, headlap, crossBonded, minGauge, maxGauge, minSpacing, maxSpacing, datasheet_link } = req.body;
  try {
    const result = await pool.query(
      'UPDATE tiles SET name = $1, type = $2, length = $3, width = $4, eave_tile_length = $5, headlap = $6, crossBonded = $7, minGauge = $8, maxGauge = $9, minSpacing = $10, maxSpacing = $11, datasheet_link = $12 WHERE id = $13 RETURNING *',
      [name, type, length, width, eave_tile_length, headlap, crossBonded, minGauge, maxGauge, minSpacing, maxSpacing, datasheet_link, id]
    );
    res.json(result.rows[0]);
  } catch (err) {
    console.error('Error updating tile:', err);
    res.status(500).json({ message: 'Server error' });
  }
});

// Delete a tile (admin only)
router.delete('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    await pool.query('DELETE FROM tiles WHERE id = $1', [id]);
    res.json({ message: 'Tile deleted' });
  } catch (err) {
    console.error('Error deleting tile:', err);
    res.status(500).json({ message: 'Server error' });
  }
});

module.exports = router;