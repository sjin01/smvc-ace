package net.sjin.smvc.controller.example;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Created by lenovo on 2015/1/19.
 */
public class Test {
    public static void main(String args[]){

        JedisPool pool;
        Jedis jedis;
        pool = new JedisPool(new JedisPoolConfig(), "127.0.0.1");
        jedis = pool.getResource();


        System.out.println(jedis.get("eduz_100_mail_push_1"));
//        jedis.del("eduz_100_mail_push_1");
//        jedis.del("eduz_100_mail_push_2");

    }
}
