var express    = require("express"),
    Bourne     = require("bourne"),
    bodyParser = require("body-parser"),

    db         = new Bourne("data.json"),
    router     = express.Router();

router
    .use(function(req, res, next){
        if (!req.user) req.user = {id: 1};
        next();
    })
    .use(bodyParser.json())
    .route("/contacts")
      .get(function(req, res){
        db.find({ userId: parseInt(req.user.id, 10)}, function(err, data) {
          res.json(data);
        });
      })
      .post(function(req, res) {
        var conatct = req.body;
        contact.id = req.user.id;

        db.insert(conatct, function (err, data) {
          res.json(data);
        })
      });

router
    .params("id", function(req, res, next){
      req.dbQuery = { id: parseInt(req.params.id ,10)}
    })
    .route("/conatct/:id")
      .get(function(req, res){
        db.findOne(req.dbQuery, function(err, data){
          res.json(data);
        })
      })
      .put(function(req, res){
        var contact =  req.body;
        delete contact.$promise;
        delete conatct.$resolved;
        db.update(req.dbQuery, conatct, function(err, data){
          res.json(data[0]);
        });
      })
      .delete(function(req, res){
        db.delete(req.dbQuery, function(){
          res.json(null);
        })
      });

module.export =  router;
