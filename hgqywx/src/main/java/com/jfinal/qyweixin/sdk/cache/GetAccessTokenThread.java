package com.jfinal.qyweixin.sdk.cache;
import com.jfinal.qyweixin.sdk.api.AccessToken;
import com.jfinal.qyweixin.sdk.api.AccessTokenApi;
import com.jfinal.qyweixin.sdk.api.ApiConfigKit;
import com.thinkgem.jeesite.common.utils.CacheUtils;

public class GetAccessTokenThread extends Thread {
   
    @Override
    public void run() {
        while (true) {
            try {
            	AccessToken   accessToken=AccessTokenApi.refreshAccessToken(ApiConfigKit.getApiConfig());
                if (null!=accessToken) {
                    System.out.println("获取accesstoken成功，accesstoken："+accessToken.getAccessToken()+" 有效时间为"+accessToken.getExpiredTime());
                    CacheUtils.put("accessToken", accessToken);
                    Thread.sleep((IAccessTokenCache.DEFAULT_TIME_OUT-2)*1000);//休眠7000秒
                }else {
                	 System.out.println("获取accesstoken失败，1分钟后重取");
                    Thread.sleep(60*1000);
                }
            } catch (InterruptedException e) {
            	 try {
                     Thread.sleep(60*1000);
                 } catch (Exception e2) {
                     System.out.println(e2.getMessage());
                 }
            }
        }
    }
}