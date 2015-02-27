Node 推送服务：
1：被推送方通过ajax 跨域请求获得工程中的客户端页面后，
在自己的页面中加载显示。

2：被推送方传递userid作为唯一标识

3：需要使用redis作为双方的订阅、发布缓存，双方后台交互数据从redis中进行更新。

示例：邮件推送：
1：在north.html中定义一个隐藏块，存储userid.
<div id="push_userid" class="hide" >$!loginUser.id</div>
在此页面加载
<script src="$contextPath/static/ace/js_mod/push_msg.js"></script>
此js会获取node推送过来的数据，根据需要自行展示。

push_msg.js
此处url地址为部署了nginx后配置好了转发的地址，请按照实际情况进行修改


applicationContext-redis.xml
主要配置了redis信息，
	<bean id="jedisPool" class="redis.clients.jedis.JedisPool">
		<constructor-arg index="0" ref="jedisPoolConfig" />
		<constructor-arg index="1" value="127.0.0.1" />
		<constructor-arg index="2" value="6379" />
	</bean>
请按实际情况进行填写。


push模块与其他模块一起使用需要前提：

nginx提供转发
#node
	location /socket.io/{
		proxy_pass http://192.168.2.114:3000;
	}
#node js
	location /javascripts/{
		proxy_pass http://192.168.2.114:3000;
	}
#项目
	location /eduz100/{
		proxy_pass http://192.168.2.114:11111;
	}
#node
	location /push/ {
		proxy_pass http://192.168.2.114:3000;
	}
#node 资源文件
	location /assets/{
		proxy_pass http://192.168.2.114:3000;
	}

node.js安装完成

redis安装完成
默认本机、端口6379


推送JS为socket.io
只需要在项目页面加载此JS就可以接受推送来的消息。








