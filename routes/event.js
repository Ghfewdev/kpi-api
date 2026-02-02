const express = require("express");
const multer = require("multer");
const mysql = require('mysql2')
const path = require("path");
const fs = require("fs");
const router = express.Router();

const db = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    // port: process.env.DB_PORT,
    password: process.env.DB_PASS,
    database: process.env.DB_DATABASE2
})

/* ===============================
   เตรียมโฟลเดอร์ upload
================================ */
const ensureDir = (dir) => {
  if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
};

ensureDir("uploads/images");
ensureDir("uploads/pdf");

/* ===============================
   multer config
================================ */
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    if (file.mimetype.startsWith("image")) {
      cb(null, "uploads/images");
    } else {
      cb(null, "uploads/pdf");
    }
  },
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    const name = Date.now() + "-" + Math.round(Math.random() * 1e9);
    cb(null, name + ext);
  },
});

const upload = multer({
  storage,
  limits: { fileSize: 5 * 1024 * 1024 },
});

/* ===============================
   GET : all events
================================ */
router.get("/", (req, res) => {
  db.query(
    "SELECT * FROM events ORDER BY created_at DESC",
    (err, rows) => {
      if (err) {
        console.error("DB error:", err);
        return res.status(500).json({
          status: "error",
          message: "Error fetching events",
        });
      }
      res.json(rows);
    }
  );
});

router.get("/res/:usid/:fmid", (req, res) => {
  const usid = req.params.usid
  const fmid = req.params.fmid

  db.query(
    "SELECT * FROM events WHERE submitid = ? AND fmid = ? ORDER BY created_at DESC", [usid, fmid], 
    (err, rows) => {
      if (err) {
        console.error("DB error:", err);
        return res.status(500).json({
          status: "error",
          message: "Error fetching events",
        });
      }
      res.json(rows);
    }
  );
});

/* ===============================
   POST : add event
================================ */
router.post(
  "/add",
  upload.fields([
    { name: "image", maxCount: 1 },
    { name: "pdf", maxCount: 1 },
  ]),
  (req, res) => {
    try {
      const b = req.body;
      const files = req.files || {};
      const result = JSON.parse(b.result || "{}");

      const sql = `
        INSERT INTO events (
          fmid, fmsid, qur, submitid, 
          evname, evres, evstatus,
          budget_dc1, budget_dc2, budget_dc3,
          budget_dd1, budget_dd2, budget_dd3,
          evpoint, evtarget,
          result_q1, result_q2, result_q3, result_q4,
          problem, summary_status,
          image_file, pdf_file
        ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
      `;

      const values = [
        b.fmid || null,
        b.fmsid,
        b.qur,
        b.submitid,
        b.evname,
        b.evres,
        b.evstatus,
        b.dc1 || 0,
        b.dc2 || 0,
        b.dc3 || 0,
        b.dd1 || 0,
        b.dd2 || 0,
        b.dd3 || 0,
        b.evpoint,
        b.evtarget,
        result.q1 || null,
        result.q2 || null,
        result.q3 || null,
        result.q4 || null,
        b.problem || null,
        b.et,
        files.image?.[0]?.filename || null,
        files.pdf?.[0]?.filename || null,
      ];

      db.query(sql, values, (err) => {
        if (err) {
          console.error("ADD EVENT ERROR:", err);
          return res.status(500).json({ status: "error" });
        }

        res.json({ status: "ok" });
      });
    } catch (e) {
      console.error("ADD EVENT PARSE ERROR:", e);
      res.status(500).json({ status: "error" });
    }
  }
);

/* ===============================
   PUT : update event
================================ */
router.put(
  "/:id",
  upload.fields([
    { name: "image", maxCount: 1 },
    { name: "pdf", maxCount: 1 },
  ]),
  (req, res) => {
    const id = req.params.id;

    db.query(
      "SELECT image_file, pdf_file FROM events WHERE id=?",
      [id],
      (err, rows) => {
        if (err) {
          console.error("FETCH OLD EVENT ERROR:", err);
          return res.status(500).json({ status: "error" });
        }

        if (!rows.length) {
          return res.status(404).json({ status: "not_found" });
        }

        const old = rows[0];
        let imageFile = old.image_file;
        let pdfFile = old.pdf_file;

        if (req.files?.image?.[0]) {
          if (imageFile) fs.unlink(`uploads/images/${imageFile}`, () => {});
          imageFile = req.files.image[0].filename;
        }

        if (req.files?.pdf?.[0]) {
          if (pdfFile) fs.unlink(`uploads/pdf/${pdfFile}`, () => {});
          pdfFile = req.files.pdf[0].filename;
        }

        let result = {};
        try {
          result = JSON.parse(req.body.result || "{}");
        } catch {}

        const sql = `
          UPDATE events SET
            fmid=?, fmsid=?, qur=?, submitid=?,
            evname=?, evres=?, evstatus=?,
            budget_dc1=?, budget_dc2=?, budget_dc3=?,
            budget_dd1=?, budget_dd2=?, budget_dd3=?,
            evpoint=?, evtarget=?,
            result_q1=?, result_q2=?, result_q3=?, result_q4=?,
            problem=?, summary_status=?,
            image_file=?, pdf_file=?
          WHERE id=?
        `;

        const values = [
          req.body.fmid || null,
          req.body.fmsid,
          req.body.qur,
          req.body.submitid,
          req.body.evname,
          req.body.evres,
          req.body.evstatus,
          req.body.dc1 || 0,
          req.body.dc2 || 0,
          req.body.dc3 || 0,
          req.body.dd1 || 0,
          req.body.dd2 || 0,
          req.body.dd3 || 0,
          req.body.evpoint,
          req.body.evtarget,
          result.q1 || null,
          result.q2 || null,
          result.q3 || null,
          result.q4 || null,
          req.body.problem || null,
          req.body.et,
          imageFile,
          pdfFile,
          id,
        ];

        db.query(sql, values, (err) => {
          if (err) {
            console.error("UPDATE EVENT ERROR:", err);
            return res.status(500).json({ status: "error" });
          }

          res.json({ status: "ok" });
        });
      }
    );
  }
);

/* ===============================
   DELETE : event
================================ */
router.delete("/:id", (req, res) => {
  const id = req.params.id;

  db.query(
    "SELECT image_file, pdf_file FROM events WHERE id=?",
    [id],
    (err, rows) => {
      if (err) {
        console.error("FETCH EVENT ERROR:", err);
        return res.status(500).json({ status: "error" });
      }

      if (!rows.length) {
        return res.status(404).json({ status: "not_found" });
      }

      const event = rows[0];

      if (event.image_file) fs.unlink(`uploads/images/${event.image_file}`, () => {});
      if (event.pdf_file) fs.unlink(`uploads/pdf/${event.pdf_file}`, () => {});

      db.query("DELETE FROM events WHERE id=?", [id], (err) => {
        if (err) {
          console.error("DELETE EVENT ERROR:", err);
          return res.status(500).json({ status: "error" });
        }

        res.json({ status: "ok" });
      });
    }
  );
});

module.exports = router;
