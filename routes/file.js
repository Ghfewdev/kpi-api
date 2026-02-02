const express = require("express");
const path = require("path");
const fs = require("fs");
const mysql = require('mysql2')
const router = express.Router();
const db = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    // port: process.env.DB_PORT,
    password: process.env.DB_PASS,
    database: process.env.DB_DATABASE2
})

/* ===============================
   GET image by event id
================================ */
router.get("/image/:id", (req, res) => {
  const id = req.params.id;

  db.query(
    "SELECT image_file FROM events WHERE id=?",
    [id],
    (err, rows) => {
      if (err || !rows.length) {
        return res.status(404).send("Not found");
      }

      const file = rows[0].image_file || "noimg.PNG";
      const filePath = path.join(
        __dirname,
        "..",
        "uploads",
        "images",
        file
      );

      if (!fs.existsSync(filePath)) {
        return res.status(404).send("File not found");
      }

      res.sendFile(filePath);
    }
  );
});

/* ===============================
   GET pdf by event id
================================ */
router.get("/pdf/:id", (req, res) => {
  const id = req.params.id;

  db.query(
    "SELECT pdf_file FROM events WHERE id=?",
    [id],
    (err, rows) => {
      if (err || !rows.length) {
        return res.status(404).send("Not found");
      }

      const file = rows[0].pdf_file;
      if (!file) return res.status(404).send("No PDF");

      const filePath = path.join(
        __dirname,
        "..",
        "uploads",
        "pdf",
        file
      );

      if (!fs.existsSync(filePath)) {
        return res.status(404).send("File not found");
      }

      res.setHeader("Content-Type", "application/pdf");
      res.sendFile(filePath);
    }
  );
});

module.exports = router;
