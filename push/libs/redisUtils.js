/**
 * redis工具类，连接redis获取数据和订购，然后将获得的数据通过socket.io 推送过去
 * @type {exports}
 */
var redis = require("redis");
var logger = require('../libs/log').logger;
var settings = require('../settings');

function redisUtils(){};

redisUtils.getRedisClient = function getRedisClient(){
    var client  = redis.createClient(settings.redis.port, settings.redis.ip);

    client.max_attempts = 5;
    if(client != null){
        client.on('disconnect', function () {
            logger.info("redis断开连接");
            console.info("redis断开连接");
        });

        client.on('error',function(err) {
            if (err) {
                logger.error("redis error"+err);
                console.error("redis断开连接");
                throw err;
            }
        });
    }
    return  client;
};


redisUtils.getRedisClientPubSub = function getRedisClientPubSub(){
    var client  = redis.createClient(settings.redis.port, settings.redis.ip);

    client.max_attempts = 5;
    if(client != null){
        client.on('disconnect', function () {
            logger.info("redis断开连接");
            console.info("redis断开连接");
            client.end();
        });

        client.on('error',function(err) {
            if (err) {
                logger.error("redis error"+err);
                console.error("redis断开连接");
                client.end();
                throw err;
            }
        });
    }
    return  client;
};



/**
 * 获得未读邮件数量--用于页面打开时
 * @param socket
 */
redisUtils.getRedisUnReadMailCount = function getRedisUnReadMailCount(usercode,socket){
        var client = redisUtils.getRedisClient();

        if(client!=null){
            console.info("客户端传递过来userid：：："+usercode);
            var push_userid = settings.push_conf.mail_prefix+usercode;
            console.info("redis 中的push_userid：：："+push_userid);

            var getRedisContent = client.get(push_userid,function(err,reply){
                if(err){
                    console.error("获取邮件信息异常："+err)
                    return null;
                }
                else{
                    console.info("redis data：：："+reply);
                    if(reply){
                        var result = JSON.parse(reply);
                        if(result){
                            socket.emit(settings.push_conf.push_sub_prefix+usercode,result);
                            // 关闭链接
                            client.end();
                        }
                    }
                }
            });
        }
};


/**
 * 获得未读邮件数量--用于页面打开时
 * @param socket
 */
redisUtils.getRedisUnReadMessageCount = function getRedisUnReadMessageCount(usercode,socket){
    var client = redisUtils.getRedisClient();

    if(client!=null){
        console.info("客户端传递过来userid：：："+usercode);
        var push_userid = settings.push_conf.message_prefix+usercode;
        console.info("redis 中的push_userid：：："+push_userid);

        var getRedisContent = client.get(push_userid,function(err,reply){
            if(err){
                console.error("获取消息信息异常："+err)
                return null;
            }
            else{
                console.info("redis data：：："+reply);
                if(reply){
                    var result = JSON.parse(reply);
                    if(result){
                        socket.emit(settings.push_conf.push_sub_prefix+usercode,result);
                        // 关闭链接
                        client.end();
                    }
                }
            }
        });
    }
};



/**
 * 获得未读通知数量--用于页面打开时
 * @param socket
 */
redisUtils.getRedisUnReadNoticeCount = function getRedisUnReadNoticeCount(usercode,socket){
    var client = redisUtils.getRedisClient();

    if(client!=null){
        console.info("客户端传递过来userid：：："+usercode);
        var push_userid = settings.push_conf.notice_prefix+usercode;
        console.info("redis 中的push_userid：：："+push_userid);

        var getRedisContent = client.get(push_userid,function(err,reply){
            if(err){
                console.error("获取通知信息异常："+err)
                return null;
            }
            else{
                console.info("redis data：：："+reply);
                if(reply){
                    var result = JSON.parse(reply);
                    if(result){
                        socket.emit(settings.push_conf.push_sub_prefix+usercode,result);
                        // 关闭链接
                        client.end();
                    }
                }
            }
        });
    }
};


/**
 * redis 订阅：用于收到邮件，推送这个消息时
 * @param socket
 */
redisUtils.getRedisClientMailSub = function getRedisClientMailSub(socket){

    var client = redisUtils.getRedisClientPubSub();

    if(client!=null){
        /**
         * 监听订阅,当有消息时，进行发送
         */
        client.on("subscribe", function (channel, count) {
            client.on("message", function (channel, message) {
                console.info("收到订阅的消息: " + message);
                /**
                 * 订阅eduz_100_push_msg 发布的消息，pushObject包含所有需要推送的对象，
                 * 目前只给出mail实例
                 */
                if(channel==settings.push_conf.push_sub){
                    try {
                        var pushObject = JSON.parse(message);
                        if(pushObject){
                            socket.emit(settings.push_conf.push_sub_prefix+pushObject.userid,pushObject);
                        }
                    }
                    catch (SyntaxError) { return null; }
                }

            });

        });

        /**
         * 订阅eduv_100_push_msg消息推送主题
         */
        client.subscribe(settings.push_conf.push_sub);


    }
    else{
        console.error("redis 获取不到连接");
    }

};

module.exports = redisUtils;