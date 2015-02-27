/**
 * 配置页
 * @type {exports}
 */
var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var domain = require('domain');
var debug = require('debug');
var app = express();
var router = express.Router();
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
//app.use(favicon(__dirname + '/public/favicon.ico'));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

/**
 * 项目前缀 例如： http://localhost：3000/push
 */
//app.use('/push', routes);
//app.use('/push', users);


app.set('port', process.env.PORT || 3000);

var server = app.listen(app.get('port'), function() {
    debug('Express server listening on port ' + server.address().port);
});

var sio = require('socket.io')(server);


/**
 * 在index路由中初始化socket，
 * 同时代入router可以作为路由使用
 */
var routes = require('./routes/index')(router,sio);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function(err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}

//引入一个domain的中间件，将每一个请求都包裹在一个独立的domain中
//domain来处理异常
app.use(function (req,res, next) {
    console.info("req 进入domain:"+req);
    var d = domain.create();
    //监听domain的错误事件
    d.on('error', function (err) {
        console.error(err);
        res.statusCode = 500;
        res.json({sucess:false, messag: '服务器异常'});
        d.dispose();
    });

    d.add(req);
    d.add(res);
    d.run(next);
});


module.exports = app;
