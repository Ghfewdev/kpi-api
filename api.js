require('dotenv').config()
const express = require('express');
const cors = require('cors');
const app = express();
const bodyParser = require('body-parser')
const jsonParser = bodyParser.json();
const mysql = require('mysql2')
const conn = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_DATABASE
})
const bcrypt = require('bcrypt');
const saltRounds = 10;
const jwt = require('jsonwebtoken');
const secect = 'abcdefg'
const multer = require("multer");

const fs = require('fs')
const walk = require('walk');

app.use(cors());
app.use(express.json());
//app.use(jsonParser);

app.use(express.static("public"));
app.use("/images", express.static("images"))


// users
app.post('/useradd', jsonParser, (req, res, next) => {
    bcrypt.hash(req.body.password, saltRounds, (err, hash) => {
        var Isql = "INSERT INTO users (us_email, us_password, us_name, us_agency, us_level) VALUES (?, ?, ?, ?, 0)"
        var IV = [req.body.email, hash, req.body.name, req.body.agency]
        conn.execute(Isql, IV, (err, results, fields) => {
            if (err) {
                res.json({ status: 'error', massage: err })
                return
            } else
                res.json({ status: 'ok' })

        })

    });

})

app.put('/useredit', jsonParser, (req, res, next) => {
    bcrypt.hash(req.body.password, saltRounds, (err, hash) => {
        var Isql = "UPDATE users SET us_password = ?, us_name = ? WHERE us_agency = ?;"
        var IV = [hash, req.body.name, req.body.agency]
        conn.execute(Isql, IV, (err, results, fields) => {
            if (err) {
                res.json({ status: 'error', massage: err })
                return
            } else
                res.json({ status: 'ok' })

        })

    });

})


app.post('/login', jsonParser, (req, res, next) => {
    var qsql = "SELECT * FROM users WHERE us_name = ?"
    var qy = req.body.name
    conn.execute(qsql, [qy], (err, users, fields) => {
        if (err) { res.json({ status: 'error', massage: err }); return }
        if (users.length === 0) { res.json({ status: 'error', massage: 'no user not found' }); return }
        bcrypt.compare(req.body.password, users[0].us_password, (err, islogin) => {
            if (islogin) {
                var token = jwt.sign({ name: users[0].us_name }, secect, { expiresIn: '1h' })+ "$" + users[0].us_level;
                res.json({ status: 'ok', massage: 'login success', token, name: users[0].us_name, id: users[0].us_id, agency: users[0].us_agency });
            } else {
                res.json({ status: 'erorr', massage: 'login failed' })
            }
        })
    })
})

app.post('/authen', jsonParser, (req, res, next) => {
    try {
        const token = req.headers.authorization.split(" ")[1];
        const decoded = jwt.verify(token, secect);
        res.json({ status: 'ok', name: decoded.name, decoded });
    } catch (err) {
        res.json({ status: 'error', massage: err.message })
    }

});

app.get('/users', (req, res) => {
    conn.query("SELECT * FROM users ", (err, results, fields) => {
        res.send(results)
    })
});

app.get('/users/:id', (req, res) => {
    const id = req.params.id
    conn.query("SELECT * FROM users WHERE us_id = ?", [id], (err, results, fields) => {
        res.send(results)
    })
});

// form
app.post('/form/add', jsonParser, (req, res, next) => {
    var Isql = "INSERT INTO form (fm_id, fm_name, fm_solve, fm_method, fm_define, fm_paras, fm_com, fm_con, fm_numpara) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
    var IV = [req.body.id, req.body.name, req.body.solve, req.body.method, req.body.def, req.body.paras, req.body.com, req.body.con, req.body.numpara]
    conn.execute(Isql, IV, (err, results, fields) => {
        if (err) {
            res.json({ status: 'error', massage: err })
            return
        } else
            res.json({ status: 'ok' })

    })

})

app.get("/form", jsonParser, (req, res, next) => {
    conn.query("SELECT * FROM form", (err, form, fields) => {
        res.send(form);
    })
})

app.get("/form/:id", jsonParser, (req, res, next) => {
    const id = req.params.id
    conn.query("SELECT * FROM form WHERE fm_id = ?", [id], (err, form, fields) => {
        res.send(form);
    })
})

app.put("/update/form", jsonParser, (req, res, next) => {
    var sql = "UPDATE form SET fm_name = ?, fm_solve= ?, fm_define = ? WHERE fm_id = ?"
    const up = [req.body.name, req.body.solve, req.body.def, req.body.id]
    conn.execute(sql, up, (err, upd, fields) => {
        if (err) {
            res.json({ status: 'error', massage: err })
            return
        } else
            res.json({ status: 'ok' })
    })
})

//detail
app.post('/form/fill', jsonParser, (req, res, next) => {
    var Isql = "INSERT INTO detail (fm_id, de_qur, de_paras, de_ans, de_result) VALUES (?, ?, ?, ?, ?)"
    var IV = [req.body.formid, req.body.qur, req.body.paras, req.body.ans, req.body.result]
    conn.execute(Isql, IV, (err, results, fields) => {
        if (err) {
            res.json({ status: 'error', massage: err })
            return
        } else
            res.json({ status: 'ok' })

    })

})

app.get("/detail", jsonParser, (req, res, next) => {
    conn.query("SELECT * FROM detail", (err, detail, fields) => {
        res.send(detail);
    })
})


app.get("/detail/:id", jsonParser, (req, res, next) => {
    const id = req.params.id;
    conn.query("SELECT * FROM detail WHERE de_id = ?", [id], (err, detail, fields) => {
        res.send(detail);
    })
})

app.put("/update/detail", jsonParser, (req, res, next) => {
    var sql = "UPDATE detail SET de_paras = ?, de_ans= ?, de_result = ? WHERE de_id = ?"
    const up = [req.body.paras, req.body.ans, req.body.result, req.body.deid]
    conn.execute(sql, up, (err, upd, fields) => {
        if (err) {
            res.json({ status: 'error', massage: err })
            return
        } else
            res.json({ status: 'ok' })
    })
})

//formed
app.post('/formed/fill', jsonParser, (req, res, next) => {
    const date = `${new Date().getUTCFullYear()}-${new Date().getUTCMonth() + 1}-${new Date().getUTCDate()}`
    const time = `${new Date().getUTCHours() + 7}:${new Date().getUTCMinutes()}:${new Date().getUTCSeconds()}`
    var Isql = "INSERT INTO formed (us_id, de_id, fd_date, fd_time) VALUES (?, ?, ?, ?)"
    var IV = [req.body.user, req.body.detail, date, time]
    conn.execute(Isql, IV, (err, results, fields) => {
        if (err) {
            res.json({ status: 'error', massage: err })
            return
        } else
            res.json({ status: 'ok' })
    })
})

app.get("/formed", jsonParser, (req, res, next) => {
    conn.query("SELECT * FROM formed", (err, formed, fields) => {
        formed = formed.map(d => {
            d.fd_date = d.fd_date.toISOString().split('T')[0];
            return d;
        })
        res.send(formed)
    })
})

app.get("/formed/:id", jsonParser, (req, res, next) => {
    const id = req.params.id
    conn.query("SELECT * FROM formed WHERE fd_id = ?", [id], (err, formed, fields) => {
        res.send(formed)
    })
})

//event
app.get("/event", jsonParser, (req, res, next) => {
    conn.query("SELECT * FROM event", (err, ev, fields) => {
        res.send(ev)
    })
})

app.get("/event/:id", jsonParser, (req, res, next) => {
    const id = req.params.id
    conn.query("SELECT * FROM event WHERE de_id = ?;", [id], (err, evid, fields) => {
        res.send(evid)
    })
})

app.post("/ev/add", jsonParser, (req, res, next) => {
    const sql = "INSERT INTO event (de_id, fms_id, ev_name, ev_res, ev_status, ev_budget, ev_buded, ev_point, ev_target, ev_result , ev_problem, ev_str, ev_img) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    //const val = [req.body.deid, req.body.fmsid, req.body.evname, req.body.evres, req.body.evstatus, req.body.evbudget, req.body.evbuded, req.body.evpoint, req.body.evtarget, req.body.result, req.body.problem, req.body.evimg];
    const val = [req.body.deid, req.body.fmsid, req.body.evname, req.body.evres, req.body.evstatus, req.body.evbudget, req.body.evbuded, req.body.evpoint, req.body.evtarget, req.body.result, req.body.problem, req.body.str, "{}"];
    conn.execute(sql, val, (err, ev, fields) => {
        if (err) {
            res.json({status: "erorr", massage: err});
            return;
        }else {
            res.json({status: "ok"})
        }
    })
})

app.put("/ev/edit", jsonParser, (req, res, next) => {
    const sql = "UPDATE event SET fms_id = ?, ev_name = ?, ev_res = ?, ev_status = ?, ev_budget = ?, ev_buded = ?, ev_point = ?, ev_target = ?, ev_result = ?, ev_problem = ?, ev_str = ?, ev_img = ? WHERE de_id = ?";
    //const val = [req.body.fmsid, req.body.evname, req.body.evres, req.body.evstatus, req.body.evbudget, req.body.evbuded, req.body.evpoint, req.body.evtarget, req.body.result, req.body.problem, req.body.evimg, req.body.deid];
    const val = [req.body.fmsid, req.body.evname, req.body.evres, req.body.evstatus, req.body.evbudget, req.body.evbuded, req.body.evpoint, req.body.evtarget, req.body.result, req.body.problem, req.body.str, "{}", req.body.deid];
    conn.execute(sql, val, (err, ev, fields) => {
        if (err) {
            res.json({status: "erorr", massage: err});
            return;
        }else {
            res.json({status: "ok"})
        }
    })
})

app.put("/ev/edit/img", jsonParser, (req, res, next) => {
    const sql = "UPDATE event SET ev_img = ? WHERE de_id = ?";
    const val = [req.body.evimg, req.body.deid];
    conn.execute(sql, val, (err, ev, fields) => {
        if (err) {
            res.json({status: "erorr", massage: err});
            return;
        }else {
            res.json({status: "ok"})
        }
    })
})

//result
app.get("/result", jsonParser, (req, res, next) => {
    conn.query("SELECT * FROM result", (err, resu, fields) => {
        res.send(resu);
    })
})

app.get("/result/:id", jsonParser, (req, res, next) => {
    const id = req.params.id
    conn.query("SELECT * FROM result WHERE fm_id = ?", [id], (err, resu, fields) => {
        res.send(resu);
    })
})

app.post("/result/add", jsonParser, (req, res, next) => {
    var Isql = "INSERT INTO result (fm_id) VALUES (?)"
    var IV = [req.body.fmid]
    conn.execute(Isql, IV, (err, results, fields) => {
        if (err) {
            res.json({ status: 'error', massage: err })
            return
        } else
            res.json({ status: 'ok' })
    })
})

app.put("/result/update/:hn/:id", jsonParser, (req, res, next) => {
    const id = req.params.id
    const hn = req.params.hn
    var sql = `UPDATE result SET ${hn} = ?, ${hn}pa = ?, ${hn}pb = ?, pa1 = ?, pa2 = ?, re_sum = ? WHERE fm_id = ${id}`
    const up = [req.body.h,req.body.hpa1, req.body.hpa2, req.body.pa1, req.body.pa2, req.body.sum]
    conn.execute(sql, up, (err, upd, fields) => {
        if (err) {
            res.json({ status: 'error', massage: err })
            return
        } else
            res.json({ status: 'ok' })
    })
})


//all
app.get("/all", jsonParser, (req, res, next) => {
    conn.query("SELECT * FROM detail RIGHT JOIN formed ON detail.de_id = formed.de_id RIGHT JOIN users ON formed.us_id = users.us_id RIGHT JOIN form on form.fm_id = detail.fm_id ORDER BY users.us_id ASC;",
        (err, all, fields) => {
            all = all.map(d => {
                if (d.fd_date != null)
                    d.fd_date = d.fd_date.toISOString().split('T')[0];
                return d;
            })
            res.send(all);
        })
})

app.get("/all/:id", jsonParser, (req, res, next) => {
    const id = req.params.id
    conn.query("SELECT * FROM detail RIGHT JOIN formed ON detail.de_id = formed.de_id RIGHT JOIN users ON formed.us_id = users.us_id RIGHT JOIN form on form.fm_id = detail.fm_id WHERE detail.fm_id = ? ORDER BY users.us_id ASC",
        [id], (err, all, fields) => {
            all = all.map(d => {
                if (d.fd_date != null)
                    d.fd_date = d.fd_date.toISOString().split('T')[0];
                return d;
            })
            res.send(all);
        })
})

app.get("/all/hp/:user/:id", jsonParser, (req, res, next) => {
    const user = req.params.user
    const id = req.params.id
    conn.query("SELECT * FROM detail RIGHT JOIN formed ON detail.de_id = formed.de_id RIGHT JOIN users ON formed.us_id = users.us_id RIGHT JOIN form on form.fm_id = detail.fm_id WHERE users.us_id = ? AND detail.fm_id = ?",
        [user, id], (err, all, fields) => {
            all = all.map(d => {
                if (d.fd_date != null)
                    d.fd_date = d.fd_date.toISOString().split('T')[0];
                return d;
            })
            res.send(all);
        })
})

//report
app.get('/report/api', (req, res) => {

    const page = parseInt(req.query.page);
    const per_page = parseInt(req.query.per_page);
    const sort_collumn = req.query.sort_collumn;
    const sort_direction = req.query.sort_direction;
    const quarter = req.query.quarter;
    const search = req.query.search;

    const start_idx = (page - 1) * per_page;
    var params = [];
    var sql = "SELECT * FROM detail RIGHT JOIN formed ON detail.de_id = formed.de_id RIGHT JOIN users ON formed.us_id = users.us_id RIGHT JOIN form on form.fm_id = detail.fm_id";
    if (quarter) {
        sql += " WHERE de_qur = ?"
        params.push(quarter);
    }
    if (search) {
        sql += " WHERE us_agency LIKE ? "
        params.push("%" + search + "%");
    }
    if (sort_collumn) {
        sql += " ORDER BY " + sort_collumn + " " + sort_direction;
    }
    sql += " LIMIT ?, ? ";
    params.push(start_idx);
    params.push(per_page);
    
    console.log(sql, params);
    conn.execute(sql, params, (err, tables, fields) => {
        tables = tables.map(d => {
            if (d.fd_date != null)
                d.fd_date = d.fd_date.toISOString().split('T')[0];
            return d;
        })
        console.log(tables)
        res.json(tables)
    })
});

//detail+form 
app.get("/checked", jsonParser, (req, res, next) => {
    const sql = "SELECT formed.us_id, detail.fm_id FROM formed RIGHT JOIN detail ON formed.de_id = detail.de_id"
    conn.query(sql, (req, results, fields) => {
        res.send(results)
    })
})

app.get("/checked/:qu", jsonParser, (req, res, next) => {
    var qu = req.params.qu
    const sql = "SELECT formed.us_id, detail.fm_id FROM formed RIGHT JOIN detail ON formed.de_id = detail.de_id WHERE detail.de_qur = ?"
    conn.query(sql, [qu], (req, results, fields) => {
        res.send(results)
    })
})

app.get("/checked/:de", jsonParser, (req, res, next) => {
    var de = req.params.de
    const sql = "SELECT * FROM formed RIGHT JOIN detail ON formed.de_id = detail.de_id WHERE detail.de_qur = ? ORDER BY formed.us_id ASC"
    conn.query(sql, [de], (req, results, fields) => {
        res.send(results)
    })
})

app.get("/checked/user/:us/:fm", jsonParser, (req, res, next) => {
    var us = req.params.us
    var fm = req.params.fm
    const sql = "SELECT de_qur FROM formed RIGHT JOIN detail ON formed.de_id = detail.de_id WHERE formed.us_id = ? AND detail.fm_id =? ORDER BY formed.us_id ASC"
    conn.query(sql, [us, fm], (req, results, fields) => {
        res.send(results)
    })
})

app.get("/checked/id/:fm/:de", jsonParser, (req, res, next) => {
    var fm = req.params.fm
    var de = req.params.de
    const sql = "SELECT * FROM formed RIGHT JOIN detail ON formed.de_id = detail.de_id WHERE detail.fm_id = ? AND detail.de_qur = ? ORDER BY formed.us_id ASC"
    conn.query(sql, [fm, de], (req, results, fields) => {
        res.send(results)
    })
})


//re+fm

app.get("/ans", jsonParser, (req, res, next) => {
    conn.query("SELECT * FROM result RIGHT JOIN form ON result.fm_id = form.fm_id WHERE result.re_id IS NOT NULL ORDER BY result.fm_id ASC;", (err, ans, fields) => {
        res.send(ans)
    })
})

//ev+de
app.get("/evde", jsonParser, (req, res, next) => {
    conn.query("SELECT * FROM event RIGHT JOIN detail ON event.de_id = detail.de_id WHERE event.de_id IS NOT NULL ORDER BY detail.de_id ASC;", (err, even, fields) => {
        res.send(even)
    })
})

app.get('/evde/:id', (req, res) => {
    const id = req.params.id
    conn.query("SELECT * FROM event RIGHT JOIN detail ON event.de_id = detail.de_id WHERE event.de_id = ? ORDER BY detail.de_id ASC;", [id], (err, evid, fields) => {
        res.send(evid)
    })
});

//uploads


const storage = multer.diskStorage({
    destination: function(req, file, cd) {
        return cd(null, "./images")
    },
    filename: function(req, file, cd) {
        return cd(null, `${new Date().getMilliseconds()}_${(file.originalname).split(".")[0]}.${(file.originalname).split(".")[1]}`)
    }
})

const upload = multer({storage})

app.post("/upload", upload.single("file"), (req, res) => {
    res.json({ filename: req.file.filename })
})

//overviweimg
app.get("/files", (req, res) => {

    var files = [];

    var walker = walk.walk('./images', { followLinks: false });

    walker.on('file', function (root, stat, next) {
        files.push(stat.name);
        next();
    });

    walker.on('end', function () {
        res.send(files);
    });
})

//Home
app.get("/", (req, res) => {
    res.send("API")
})

//remove file
app.post("/rm/image/:name", jsonParser, (req, res, next) => {
const name = req.params.name
const path = "./images/"+name
fs.unlink(path, (err) => {
    res.json({ status: "OK" })
    if (err) {
      console.error(err)
      return
    }
  })
})

const Port = process.env.PORT || 5000
app.listen(Port, jsonParser, () => {
    console.log(`start server on Port ${Port}`)
})
