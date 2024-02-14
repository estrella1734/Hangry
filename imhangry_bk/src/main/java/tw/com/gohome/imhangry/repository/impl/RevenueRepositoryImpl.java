package tw.com.gohome.imhangry.repository.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.json.JSONObject;

import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import tw.com.gohome.imhangry.domain.Revenue;
import tw.com.gohome.imhangry.repository.declaredinterfaces.RevenueRepositoryCustom;
import tw.com.gohome.imhangry.util.DatetimeConverter;

public class RevenueRepositoryImpl implements RevenueRepositoryCustom{
    
    @PersistenceContext
    private Session session;

    public Session getSession() {
        return this.session;
    }

    @Override
    public long count(JSONObject param) {
        // select count(*) from product where id=? and name like ? and price < ? and make > ? and expire >= ?
        Integer id = param.isNull("id") ? null : param.getInt("id");
        String name = param.isNull("name") ? null : param.getString("name");
        Double price = param.isNull("price") ? null : param.getDouble("price");
        String temp = param.isNull("make") ? null : param.getString("make");
        Integer expire = param.isNull("expire") ? null : param.getInt("expire");

        CriteriaBuilder builder = this.getSession().getCriteriaBuilder();
        CriteriaQuery<Long> query = builder.createQuery(Long.class);

        // from product
        Root<Revenue> table = query.from(Revenue.class);

        // select count(*)
        query = query.select(builder.count(table));

        List<Predicate> predicates = new ArrayList<>();
        // id=?
        if (id != null) {
            predicates.add(builder.equal(table.get("id"), id));
        }

        // name like ?
        if (name != null && name.length() != 0) {
            predicates.add(builder.like(table.get("name"), "%" + name + "%"));
        }

        // price < ?
        if (price != null) {
            predicates.add(builder.lessThan(table.get("price"), price));
        }

        // make > ?
        if (temp != null && temp.length() != 0) {
            java.util.Date make = DatetimeConverter.parse(temp, "yyyy-MM-dd");
            predicates.add(builder.greaterThan(table.get("make"), make));
        }

        // expire >= ?
        if (expire != null) {
            predicates.add(builder.greaterThanOrEqualTo(table.get("expire"), expire));
        }

        if (predicates != null && !predicates.isEmpty()) {
            query = query.where(predicates.toArray(new Predicate[0]));
        }

        TypedQuery<Long> typedQuery = this.getSession().createQuery(query);
        Long result = typedQuery.getSingleResult();
        if (result != null) {
            return result;
        } else {
            return 0;
        }
    }

    @Override
    public List<Revenue> findRevenueBetweenDates(JSONObject param) {
        // SELECT revenue FROM revenue WHERE date BETWEEN '?' AND '?'

        // 從JSON取出查詢區間，取出時暫時儲存為string，後續轉換成java.util.date
        String tempStartDate = param.isNull("startDate") ? null : param.getString("startDate");
        String tempEndDate = param.isNull("endDate") ? null : param.getString("endDate");

        // 取得 CriteriaBuilder 以及 CriteriaQuery
        CriteriaBuilder builder = this.getSession().getCriteriaBuilder();
        CriteriaQuery<Revenue> query = builder.createQuery(Revenue.class);

        // from revenue
        // 從 RevenueBean 實體類別對應的資料表中查詢
        Root<Revenue> table = query.from(Revenue.class);

        // 創建用於構建查詢條件的 Predicate 列表
        List<Predicate> predicates = new ArrayList<>();

        // WHERE date BETWEEN '?'<- AND '?'
        if (tempStartDate != null &&
                tempStartDate.length() != 0 &&
                tempEndDate != null &&
                tempEndDate.length() != 0) {
                    
            java.util.Date startDate = DatetimeConverter.parse(tempStartDate, "yyyy-MM-dd");
            java.util.Date endDate = DatetimeConverter.parse(tempEndDate, "yyyy-MM-dd");

            // 創建條件：date BETWEEN startDate AND endDate
            Predicate dateBetween = builder.between(table.get("date"), startDate, endDate);

            // 將條件添加到 Predicate 列表中
            predicates.add(dateBetween);
        }

        // 將條件加入查詢中
        if (predicates != null && !predicates.isEmpty()) {
            query = query.where(predicates.toArray(new Predicate[0]));
        }

        // 執行查詢
        TypedQuery<Revenue> typedQuery = this.getSession().createQuery(query);
        List<Revenue> result = typedQuery.getResultList();
        return result;
    }
}
