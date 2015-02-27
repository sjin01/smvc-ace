module.exports = {
    cookieSecret: 'push_linli',
    db: 'push_linli',
    host: 'localhost',
    port: 3000,
    redis : {
        port:6379,
        ip:'127.0.0.1'
    },
    push_conf:{
        mail_prefix:"eduz_100_mail_push_",  //邮件前缀
        message_prefix:"eduz_100_message_push_",  //邮件前缀
        notice_prefix:"eduz_100_notice_push_",  //邮件前缀
        push_sub_prefix:"eduz_100_push_",    //订购前缀
        push_sub:"eduz_100_push_msg"          //redis 临澧订购参数

    }
};


