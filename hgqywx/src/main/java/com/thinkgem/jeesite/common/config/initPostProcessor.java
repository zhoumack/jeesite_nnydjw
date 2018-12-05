package com.thinkgem.jeesite.common.config;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.jfinal.qyweixin.sdk.api.AccessTokenApi;
import com.jfinal.qyweixin.sdk.api.ApiConfig;
import com.jfinal.qyweixin.sdk.api.ApiConfigKit;
import com.jfinal.qyweixin.sdk.cache.DefaultAccessTokenCache;
import com.jfinal.qyweixin.sdk.cache.GetAccessTokenThread;
//import com.jfinal.qyweixin.sdk.cache.RedisAccessTokenCache;
import com.jfinal.qyweixin.sdk.kit.HttpKit;
@Component
public class initPostProcessor implements ApplicationListener<ContextRefreshedEvent> {
	private static Logger logger = LoggerFactory.getLogger(initPostProcessor.class);
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		ApplicationContext app=event.getApplicationContext();
		ApplicationContext appParent=app.getParent();
		if(appParent!=null){
			return;
		}else{
			System.out.println("找到ApplicationContext容器");
		}
			//需要执行的逻辑代码，当spring容器初始化完成后就会执行该方法。
			logger.debug("onApplicationEvent启动");
			ApiConfig ac = new ApiConfig();

			// 配置微信 API 相关常量
			ac.setToken(Global.getConfig("token"));
			ac.setCorpId(Global.getConfig("corpId"));
			ac.setCorpSecret(Global.getConfig("secret"));
			ac.setAgentId(Global.getConfig("agentId"));
			ac.setEncodingAesKey(Global.getConfig("encodingAesKey"));
//
//			/**
//			 * 是否对消息进行加密，对应于微信平台的消息加解密方式： 1：true进行加密且必须配置 encodingAesKey
//			 * 2：false采用明文模式，同时也支持混合模式
//			 */
			ac.setEncryptMessage(Global.isBlooean("encryptMessage", false));
			ac.setEncodingAesKey(Global.getConfig("encodingAesKey", "setting it in config file"));
			ApiConfigKit.putApiConfig(ac);
			ApiConfigKit.setAccessTokenCache(new DefaultAccessTokenCache());
			Thread  t=new GetAccessTokenThread();
			t.start();
//			Runnable runnable = new Runnable() {
//				public void run() {
//					/**
//					 * 定时设置accessToken
//					 */
//					Global.setAccessToken(AccessTokenApi.getAccessToken());
//				}
//			};
//			
//			ScheduledExecutorService service = Executors.newSingleThreadScheduledExecutor();
//			service.scheduleAtFixedRate(runnable, 1, 7000, TimeUnit.SECONDS);
			}

}
