var logger = require('../libs/log').logger;
var redisUtils = require('../libs/redisUtils');


module.exports = function (router,io) {
    io.sockets.on('connection', function (socket) {

        socket.on("eduz_100_online",function(data){
            //console.log("收到客户端消息：：："+data);

            if(data){
                redisUtils.getRedisUnReadMailCount(data,socket);
                redisUtils.getRedisUnReadMessageCount(data,socket);
                redisUtils.getRedisUnReadNoticeCount(data,socket);
            }
        });

        redisUtils.getRedisClientMailSub(socket);

        //断开连接callback
        io.on('disconnect', function () {
            //console.log('Server has disconnected');
        });
    });

}
