package com.jfinal.qyweixin.sdk.api;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.jfinal.qyweixin.sdk.cache.DefaultAccessTokenCache;
import com.jfinal.qyweixin.sdk.cache.IAccessTokenCache;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 将 ApiConfig 绑定到 ThreadLocal 的工具类，以方便在当前线程的各个地方获取 ApiConfig 对象：
 * 1：如果控制器继承自 MsgController 该过程是自动的，详细可查看 MsgInterceptor 与之的配合
 * 2：如果控制器继承自 ApiController 该过程是自动的，详细可查看 ApiInterceptor 与之的配合
 * 3：如果控制器没有继承自 MsgController、ApiController，则需要先手动调用
 *    ApiConfigKit.setThreadLocalAgentId(getAgentId) 来绑定 agentId 到线程之上
 */
public class ApiConfigKit {

    private static final ThreadLocal<String> TL = new ThreadLocal<String>();

    private static final Map<String, ApiConfig> CFG_MAP = new ConcurrentHashMap<String, ApiConfig>();
    private static final String DEFAULT_CFG_KEY = "_default_cfg_key_";

    // 开发模式将输出消息交互 xml 到控制台
    private static boolean devMode = false;

    public static void setDevMode(boolean devMode) {
        ApiConfigKit.devMode = devMode;
    }

    public static boolean isDevMode() {
        return devMode;
    }

    /**
     * 添加公众号配置，每个corpId只需添加一次，相同corpId将被覆盖。
     * 第一个添加的将作为默认公众号配置
     * @param apiConfig 公众号配置
     * @return ApiConfig 公众号配置
     */
    public static ApiConfig putApiConfig(ApiConfig apiConfig) {
        if (CFG_MAP.size() == 0) {
            CFG_MAP.put(DEFAULT_CFG_KEY, apiConfig);
        }
        return CFG_MAP.put(apiConfig.getAgentId(), apiConfig);
    }

    public static ApiConfig removeApiConfig(ApiConfig apiConfig) {
        return removeApiConfig(apiConfig.getAgentId());
    }

    public static ApiConfig removeApiConfig(String agentId) {
        return CFG_MAP.remove(agentId);
    }

    public static void setThreadLocalAgentId(String agentId){
        if (StringUtils.isBlank(agentId)) {
        	agentId = CFG_MAP.get(DEFAULT_CFG_KEY).getAgentId();
        }
        TL.set(agentId);
    }

    public static void removeThreadLocalAgentId() {
        TL.remove();
    }

    public static String getAgentId() {
        String agentId = TL.get();
        if (StringUtils.isBlank(agentId)) {
        	agentId = CFG_MAP.get(DEFAULT_CFG_KEY).getAgentId();
        }
        return agentId;
    }

    public static ApiConfig getApiConfig() {
        return getApiConfig(getAgentId());
    }

    public static ApiConfig getApiConfig(String agentId) {
        ApiConfig cfg = CFG_MAP.get(agentId);
        if (cfg == null)
            throw new IllegalStateException("需事先调用 ApiConfigKit.putApiConfig(apiConfig) 将 agentId对应的 ApiConfig 对象存入，" +
                    "如JFinalConfig.afterJFinalStart()中调用, 才可以使用 ApiConfigKit.getApiConfig() 系列方法");
        return cfg;
    }

    static IAccessTokenCache accessTokenCache = new DefaultAccessTokenCache();
 //   static IAccessTokenCache accessTokenCache ;
    public static void setAccessTokenCache(IAccessTokenCache accessTokenCache) {
        ApiConfigKit.accessTokenCache = accessTokenCache;
    }

    public static IAccessTokenCache getAccessTokenCache() {
        return ApiConfigKit.accessTokenCache;
    }
}
