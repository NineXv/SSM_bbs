package com.ninexv.utils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class JedisUtils 
{
	// 配置对象
	private static JedisPoolConfig config;
	// 连接池
	private static JedisPool pool;
	
	static
	{
		config=new JedisPoolConfig();
		// 可以设置连接池的最大连接数
		config.setMaxTotal(200);
		// 可以设置空闲时期最大的连接数
		config.setMaxIdle(5);
		
		pool=new JedisPool(config,"148.70.145.95",6379,3000,"wangxv123");
		
	}
	
	
	public static Jedis getJedis()
	{
		return pool.getResource();
	}
}
