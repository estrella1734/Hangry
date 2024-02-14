package tw.com.gohome.imhangry.repository.declaredinterfaces;

import java.util.List;

import org.json.JSONObject;

import tw.com.gohome.imhangry.domain.Revenue;

//第一步
//在此宣告自定義查詢方法 ，之後在impl資料夾裡創建class實作此介面

public interface RevenueRepositoryCustom {

    /**
     * 此方法放入JSON
     * { startDate:'yyyy-MM-dd',
     *   endDate: 'yyyy-MM-dd'  }
     * 可以抓出每日營業額。
     * @param JSONObject
     * @return List<Revenue>
     * 
     * */ 
    public abstract List<Revenue> findRevenueBetweenDates(JSONObject param);
    
    /**
     * 此方法尚未完成
     * 目的是要抓出筆數資訊
     * @param JSONObject
     * @return long
     * 
     * */ 
    public abstract long count(JSONObject param);
}
