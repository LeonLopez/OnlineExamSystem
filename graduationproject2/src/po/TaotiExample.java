package po;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class TaotiExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TaotiExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andDifficultylevelIsNull() {
            addCriterion("difficultylevel is null");
            return (Criteria) this;
        }

        public Criteria andDifficultylevelIsNotNull() {
            addCriterion("difficultylevel is not null");
            return (Criteria) this;
        }

        public Criteria andDifficultylevelEqualTo(String value) {
            addCriterion("difficultylevel =", value, "difficultylevel");
            return (Criteria) this;
        }

        public Criteria andDifficultylevelNotEqualTo(String value) {
            addCriterion("difficultylevel <>", value, "difficultylevel");
            return (Criteria) this;
        }

        public Criteria andDifficultylevelGreaterThan(String value) {
            addCriterion("difficultylevel >", value, "difficultylevel");
            return (Criteria) this;
        }

        public Criteria andDifficultylevelGreaterThanOrEqualTo(String value) {
            addCriterion("difficultylevel >=", value, "difficultylevel");
            return (Criteria) this;
        }

        public Criteria andDifficultylevelLessThan(String value) {
            addCriterion("difficultylevel <", value, "difficultylevel");
            return (Criteria) this;
        }

        public Criteria andDifficultylevelLessThanOrEqualTo(String value) {
            addCriterion("difficultylevel <=", value, "difficultylevel");
            return (Criteria) this;
        }

        public Criteria andDifficultylevelLike(String value) {
            addCriterion("difficultylevel like", value, "difficultylevel");
            return (Criteria) this;
        }

        public Criteria andDifficultylevelNotLike(String value) {
            addCriterion("difficultylevel not like", value, "difficultylevel");
            return (Criteria) this;
        }

        public Criteria andDifficultylevelIn(List<String> values) {
            addCriterion("difficultylevel in", values, "difficultylevel");
            return (Criteria) this;
        }

        public Criteria andDifficultylevelNotIn(List<String> values) {
            addCriterion("difficultylevel not in", values, "difficultylevel");
            return (Criteria) this;
        }

        public Criteria andDifficultylevelBetween(String value1, String value2) {
            addCriterion("difficultylevel between", value1, value2, "difficultylevel");
            return (Criteria) this;
        }

        public Criteria andDifficultylevelNotBetween(String value1, String value2) {
            addCriterion("difficultylevel not between", value1, value2, "difficultylevel");
            return (Criteria) this;
        }

        public Criteria andSinglenumIsNull() {
            addCriterion("singlenum is null");
            return (Criteria) this;
        }

        public Criteria andSinglenumIsNotNull() {
            addCriterion("singlenum is not null");
            return (Criteria) this;
        }

        public Criteria andSinglenumEqualTo(Integer value) {
            addCriterion("singlenum =", value, "singlenum");
            return (Criteria) this;
        }

        public Criteria andSinglenumNotEqualTo(Integer value) {
            addCriterion("singlenum <>", value, "singlenum");
            return (Criteria) this;
        }

        public Criteria andSinglenumGreaterThan(Integer value) {
            addCriterion("singlenum >", value, "singlenum");
            return (Criteria) this;
        }

        public Criteria andSinglenumGreaterThanOrEqualTo(Integer value) {
            addCriterion("singlenum >=", value, "singlenum");
            return (Criteria) this;
        }

        public Criteria andSinglenumLessThan(Integer value) {
            addCriterion("singlenum <", value, "singlenum");
            return (Criteria) this;
        }

        public Criteria andSinglenumLessThanOrEqualTo(Integer value) {
            addCriterion("singlenum <=", value, "singlenum");
            return (Criteria) this;
        }

        public Criteria andSinglenumIn(List<Integer> values) {
            addCriterion("singlenum in", values, "singlenum");
            return (Criteria) this;
        }

        public Criteria andSinglenumNotIn(List<Integer> values) {
            addCriterion("singlenum not in", values, "singlenum");
            return (Criteria) this;
        }

        public Criteria andSinglenumBetween(Integer value1, Integer value2) {
            addCriterion("singlenum between", value1, value2, "singlenum");
            return (Criteria) this;
        }

        public Criteria andSinglenumNotBetween(Integer value1, Integer value2) {
            addCriterion("singlenum not between", value1, value2, "singlenum");
            return (Criteria) this;
        }

        public Criteria andSinglescoreIsNull() {
            addCriterion("singlescore is null");
            return (Criteria) this;
        }

        public Criteria andSinglescoreIsNotNull() {
            addCriterion("singlescore is not null");
            return (Criteria) this;
        }

        public Criteria andSinglescoreEqualTo(Integer value) {
            addCriterion("singlescore =", value, "singlescore");
            return (Criteria) this;
        }

        public Criteria andSinglescoreNotEqualTo(Integer value) {
            addCriterion("singlescore <>", value, "singlescore");
            return (Criteria) this;
        }

        public Criteria andSinglescoreGreaterThan(Integer value) {
            addCriterion("singlescore >", value, "singlescore");
            return (Criteria) this;
        }

        public Criteria andSinglescoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("singlescore >=", value, "singlescore");
            return (Criteria) this;
        }

        public Criteria andSinglescoreLessThan(Integer value) {
            addCriterion("singlescore <", value, "singlescore");
            return (Criteria) this;
        }

        public Criteria andSinglescoreLessThanOrEqualTo(Integer value) {
            addCriterion("singlescore <=", value, "singlescore");
            return (Criteria) this;
        }

        public Criteria andSinglescoreIn(List<Integer> values) {
            addCriterion("singlescore in", values, "singlescore");
            return (Criteria) this;
        }

        public Criteria andSinglescoreNotIn(List<Integer> values) {
            addCriterion("singlescore not in", values, "singlescore");
            return (Criteria) this;
        }

        public Criteria andSinglescoreBetween(Integer value1, Integer value2) {
            addCriterion("singlescore between", value1, value2, "singlescore");
            return (Criteria) this;
        }

        public Criteria andSinglescoreNotBetween(Integer value1, Integer value2) {
            addCriterion("singlescore not between", value1, value2, "singlescore");
            return (Criteria) this;
        }

        public Criteria andMultinumIsNull() {
            addCriterion("multinum is null");
            return (Criteria) this;
        }

        public Criteria andMultinumIsNotNull() {
            addCriterion("multinum is not null");
            return (Criteria) this;
        }

        public Criteria andMultinumEqualTo(Integer value) {
            addCriterion("multinum =", value, "multinum");
            return (Criteria) this;
        }

        public Criteria andMultinumNotEqualTo(Integer value) {
            addCriterion("multinum <>", value, "multinum");
            return (Criteria) this;
        }

        public Criteria andMultinumGreaterThan(Integer value) {
            addCriterion("multinum >", value, "multinum");
            return (Criteria) this;
        }

        public Criteria andMultinumGreaterThanOrEqualTo(Integer value) {
            addCriterion("multinum >=", value, "multinum");
            return (Criteria) this;
        }

        public Criteria andMultinumLessThan(Integer value) {
            addCriterion("multinum <", value, "multinum");
            return (Criteria) this;
        }

        public Criteria andMultinumLessThanOrEqualTo(Integer value) {
            addCriterion("multinum <=", value, "multinum");
            return (Criteria) this;
        }

        public Criteria andMultinumIn(List<Integer> values) {
            addCriterion("multinum in", values, "multinum");
            return (Criteria) this;
        }

        public Criteria andMultinumNotIn(List<Integer> values) {
            addCriterion("multinum not in", values, "multinum");
            return (Criteria) this;
        }

        public Criteria andMultinumBetween(Integer value1, Integer value2) {
            addCriterion("multinum between", value1, value2, "multinum");
            return (Criteria) this;
        }

        public Criteria andMultinumNotBetween(Integer value1, Integer value2) {
            addCriterion("multinum not between", value1, value2, "multinum");
            return (Criteria) this;
        }

        public Criteria andMultiscoreIsNull() {
            addCriterion("multiscore is null");
            return (Criteria) this;
        }

        public Criteria andMultiscoreIsNotNull() {
            addCriterion("multiscore is not null");
            return (Criteria) this;
        }

        public Criteria andMultiscoreEqualTo(Integer value) {
            addCriterion("multiscore =", value, "multiscore");
            return (Criteria) this;
        }

        public Criteria andMultiscoreNotEqualTo(Integer value) {
            addCriterion("multiscore <>", value, "multiscore");
            return (Criteria) this;
        }

        public Criteria andMultiscoreGreaterThan(Integer value) {
            addCriterion("multiscore >", value, "multiscore");
            return (Criteria) this;
        }

        public Criteria andMultiscoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("multiscore >=", value, "multiscore");
            return (Criteria) this;
        }

        public Criteria andMultiscoreLessThan(Integer value) {
            addCriterion("multiscore <", value, "multiscore");
            return (Criteria) this;
        }

        public Criteria andMultiscoreLessThanOrEqualTo(Integer value) {
            addCriterion("multiscore <=", value, "multiscore");
            return (Criteria) this;
        }

        public Criteria andMultiscoreIn(List<Integer> values) {
            addCriterion("multiscore in", values, "multiscore");
            return (Criteria) this;
        }

        public Criteria andMultiscoreNotIn(List<Integer> values) {
            addCriterion("multiscore not in", values, "multiscore");
            return (Criteria) this;
        }

        public Criteria andMultiscoreBetween(Integer value1, Integer value2) {
            addCriterion("multiscore between", value1, value2, "multiscore");
            return (Criteria) this;
        }

        public Criteria andMultiscoreNotBetween(Integer value1, Integer value2) {
            addCriterion("multiscore not between", value1, value2, "multiscore");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsenumIsNull() {
            addCriterion("trueorfalsenum is null");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsenumIsNotNull() {
            addCriterion("trueorfalsenum is not null");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsenumEqualTo(Integer value) {
            addCriterion("trueorfalsenum =", value, "trueorfalsenum");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsenumNotEqualTo(Integer value) {
            addCriterion("trueorfalsenum <>", value, "trueorfalsenum");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsenumGreaterThan(Integer value) {
            addCriterion("trueorfalsenum >", value, "trueorfalsenum");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsenumGreaterThanOrEqualTo(Integer value) {
            addCriterion("trueorfalsenum >=", value, "trueorfalsenum");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsenumLessThan(Integer value) {
            addCriterion("trueorfalsenum <", value, "trueorfalsenum");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsenumLessThanOrEqualTo(Integer value) {
            addCriterion("trueorfalsenum <=", value, "trueorfalsenum");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsenumIn(List<Integer> values) {
            addCriterion("trueorfalsenum in", values, "trueorfalsenum");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsenumNotIn(List<Integer> values) {
            addCriterion("trueorfalsenum not in", values, "trueorfalsenum");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsenumBetween(Integer value1, Integer value2) {
            addCriterion("trueorfalsenum between", value1, value2, "trueorfalsenum");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsenumNotBetween(Integer value1, Integer value2) {
            addCriterion("trueorfalsenum not between", value1, value2, "trueorfalsenum");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsescoreIsNull() {
            addCriterion("trueorfalsescore is null");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsescoreIsNotNull() {
            addCriterion("trueorfalsescore is not null");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsescoreEqualTo(Integer value) {
            addCriterion("trueorfalsescore =", value, "trueorfalsescore");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsescoreNotEqualTo(Integer value) {
            addCriterion("trueorfalsescore <>", value, "trueorfalsescore");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsescoreGreaterThan(Integer value) {
            addCriterion("trueorfalsescore >", value, "trueorfalsescore");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsescoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("trueorfalsescore >=", value, "trueorfalsescore");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsescoreLessThan(Integer value) {
            addCriterion("trueorfalsescore <", value, "trueorfalsescore");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsescoreLessThanOrEqualTo(Integer value) {
            addCriterion("trueorfalsescore <=", value, "trueorfalsescore");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsescoreIn(List<Integer> values) {
            addCriterion("trueorfalsescore in", values, "trueorfalsescore");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsescoreNotIn(List<Integer> values) {
            addCriterion("trueorfalsescore not in", values, "trueorfalsescore");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsescoreBetween(Integer value1, Integer value2) {
            addCriterion("trueorfalsescore between", value1, value2, "trueorfalsescore");
            return (Criteria) this;
        }

        public Criteria andTrueorfalsescoreNotBetween(Integer value1, Integer value2) {
            addCriterion("trueorfalsescore not between", value1, value2, "trueorfalsescore");
            return (Criteria) this;
        }

        public Criteria andEasyscoreIsNull() {
            addCriterion("easyscore is null");
            return (Criteria) this;
        }

        public Criteria andEasyscoreIsNotNull() {
            addCriterion("easyscore is not null");
            return (Criteria) this;
        }

        public Criteria andEasyscoreEqualTo(Integer value) {
            addCriterion("easyscore =", value, "easyscore");
            return (Criteria) this;
        }

        public Criteria andEasyscoreNotEqualTo(Integer value) {
            addCriterion("easyscore <>", value, "easyscore");
            return (Criteria) this;
        }

        public Criteria andEasyscoreGreaterThan(Integer value) {
            addCriterion("easyscore >", value, "easyscore");
            return (Criteria) this;
        }

        public Criteria andEasyscoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("easyscore >=", value, "easyscore");
            return (Criteria) this;
        }

        public Criteria andEasyscoreLessThan(Integer value) {
            addCriterion("easyscore <", value, "easyscore");
            return (Criteria) this;
        }

        public Criteria andEasyscoreLessThanOrEqualTo(Integer value) {
            addCriterion("easyscore <=", value, "easyscore");
            return (Criteria) this;
        }

        public Criteria andEasyscoreIn(List<Integer> values) {
            addCriterion("easyscore in", values, "easyscore");
            return (Criteria) this;
        }

        public Criteria andEasyscoreNotIn(List<Integer> values) {
            addCriterion("easyscore not in", values, "easyscore");
            return (Criteria) this;
        }

        public Criteria andEasyscoreBetween(Integer value1, Integer value2) {
            addCriterion("easyscore between", value1, value2, "easyscore");
            return (Criteria) this;
        }

        public Criteria andEasyscoreNotBetween(Integer value1, Integer value2) {
            addCriterion("easyscore not between", value1, value2, "easyscore");
            return (Criteria) this;
        }

        public Criteria andOrdinaryscoreIsNull() {
            addCriterion("ordinaryscore is null");
            return (Criteria) this;
        }

        public Criteria andOrdinaryscoreIsNotNull() {
            addCriterion("ordinaryscore is not null");
            return (Criteria) this;
        }

        public Criteria andOrdinaryscoreEqualTo(Integer value) {
            addCriterion("ordinaryscore =", value, "ordinaryscore");
            return (Criteria) this;
        }

        public Criteria andOrdinaryscoreNotEqualTo(Integer value) {
            addCriterion("ordinaryscore <>", value, "ordinaryscore");
            return (Criteria) this;
        }

        public Criteria andOrdinaryscoreGreaterThan(Integer value) {
            addCriterion("ordinaryscore >", value, "ordinaryscore");
            return (Criteria) this;
        }

        public Criteria andOrdinaryscoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("ordinaryscore >=", value, "ordinaryscore");
            return (Criteria) this;
        }

        public Criteria andOrdinaryscoreLessThan(Integer value) {
            addCriterion("ordinaryscore <", value, "ordinaryscore");
            return (Criteria) this;
        }

        public Criteria andOrdinaryscoreLessThanOrEqualTo(Integer value) {
            addCriterion("ordinaryscore <=", value, "ordinaryscore");
            return (Criteria) this;
        }

        public Criteria andOrdinaryscoreIn(List<Integer> values) {
            addCriterion("ordinaryscore in", values, "ordinaryscore");
            return (Criteria) this;
        }

        public Criteria andOrdinaryscoreNotIn(List<Integer> values) {
            addCriterion("ordinaryscore not in", values, "ordinaryscore");
            return (Criteria) this;
        }

        public Criteria andOrdinaryscoreBetween(Integer value1, Integer value2) {
            addCriterion("ordinaryscore between", value1, value2, "ordinaryscore");
            return (Criteria) this;
        }

        public Criteria andOrdinaryscoreNotBetween(Integer value1, Integer value2) {
            addCriterion("ordinaryscore not between", value1, value2, "ordinaryscore");
            return (Criteria) this;
        }

        public Criteria andDifficultscoreIsNull() {
            addCriterion("difficultscore is null");
            return (Criteria) this;
        }

        public Criteria andDifficultscoreIsNotNull() {
            addCriterion("difficultscore is not null");
            return (Criteria) this;
        }

        public Criteria andDifficultscoreEqualTo(Integer value) {
            addCriterion("difficultscore =", value, "difficultscore");
            return (Criteria) this;
        }

        public Criteria andDifficultscoreNotEqualTo(Integer value) {
            addCriterion("difficultscore <>", value, "difficultscore");
            return (Criteria) this;
        }

        public Criteria andDifficultscoreGreaterThan(Integer value) {
            addCriterion("difficultscore >", value, "difficultscore");
            return (Criteria) this;
        }

        public Criteria andDifficultscoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("difficultscore >=", value, "difficultscore");
            return (Criteria) this;
        }

        public Criteria andDifficultscoreLessThan(Integer value) {
            addCriterion("difficultscore <", value, "difficultscore");
            return (Criteria) this;
        }

        public Criteria andDifficultscoreLessThanOrEqualTo(Integer value) {
            addCriterion("difficultscore <=", value, "difficultscore");
            return (Criteria) this;
        }

        public Criteria andDifficultscoreIn(List<Integer> values) {
            addCriterion("difficultscore in", values, "difficultscore");
            return (Criteria) this;
        }

        public Criteria andDifficultscoreNotIn(List<Integer> values) {
            addCriterion("difficultscore not in", values, "difficultscore");
            return (Criteria) this;
        }

        public Criteria andDifficultscoreBetween(Integer value1, Integer value2) {
            addCriterion("difficultscore between", value1, value2, "difficultscore");
            return (Criteria) this;
        }

        public Criteria andDifficultscoreNotBetween(Integer value1, Integer value2) {
            addCriterion("difficultscore not between", value1, value2, "difficultscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreIsNull() {
            addCriterion("totalscore is null");
            return (Criteria) this;
        }

        public Criteria andTotalscoreIsNotNull() {
            addCriterion("totalscore is not null");
            return (Criteria) this;
        }

        public Criteria andTotalscoreEqualTo(Integer value) {
            addCriterion("totalscore =", value, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreNotEqualTo(Integer value) {
            addCriterion("totalscore <>", value, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreGreaterThan(Integer value) {
            addCriterion("totalscore >", value, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("totalscore >=", value, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreLessThan(Integer value) {
            addCriterion("totalscore <", value, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreLessThanOrEqualTo(Integer value) {
            addCriterion("totalscore <=", value, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreIn(List<Integer> values) {
            addCriterion("totalscore in", values, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreNotIn(List<Integer> values) {
            addCriterion("totalscore not in", values, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreBetween(Integer value1, Integer value2) {
            addCriterion("totalscore between", value1, value2, "totalscore");
            return (Criteria) this;
        }

        public Criteria andTotalscoreNotBetween(Integer value1, Integer value2) {
            addCriterion("totalscore not between", value1, value2, "totalscore");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNull() {
            addCriterion("createtime is null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNotNull() {
            addCriterion("createtime is not null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeEqualTo(Date value) {
            addCriterionForJDBCDate("createtime =", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotEqualTo(Date value) {
            addCriterionForJDBCDate("createtime <>", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThan(Date value) {
            addCriterionForJDBCDate("createtime >", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("createtime >=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThan(Date value) {
            addCriterionForJDBCDate("createtime <", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("createtime <=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIn(List<Date> values) {
            addCriterionForJDBCDate("createtime in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotIn(List<Date> values) {
            addCriterionForJDBCDate("createtime not in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("createtime between", value1, value2, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("createtime not between", value1, value2, "createtime");
            return (Criteria) this;
        }

        public Criteria andLessonidIsNull() {
            addCriterion("lessonid is null");
            return (Criteria) this;
        }

        public Criteria andLessonidIsNotNull() {
            addCriterion("lessonid is not null");
            return (Criteria) this;
        }

        public Criteria andLessonidEqualTo(Integer value) {
            addCriterion("lessonid =", value, "lessonid");
            return (Criteria) this;
        }

        public Criteria andLessonidNotEqualTo(Integer value) {
            addCriterion("lessonid <>", value, "lessonid");
            return (Criteria) this;
        }

        public Criteria andLessonidGreaterThan(Integer value) {
            addCriterion("lessonid >", value, "lessonid");
            return (Criteria) this;
        }

        public Criteria andLessonidGreaterThanOrEqualTo(Integer value) {
            addCriterion("lessonid >=", value, "lessonid");
            return (Criteria) this;
        }

        public Criteria andLessonidLessThan(Integer value) {
            addCriterion("lessonid <", value, "lessonid");
            return (Criteria) this;
        }

        public Criteria andLessonidLessThanOrEqualTo(Integer value) {
            addCriterion("lessonid <=", value, "lessonid");
            return (Criteria) this;
        }

        public Criteria andLessonidIn(List<Integer> values) {
            addCriterion("lessonid in", values, "lessonid");
            return (Criteria) this;
        }

        public Criteria andLessonidNotIn(List<Integer> values) {
            addCriterion("lessonid not in", values, "lessonid");
            return (Criteria) this;
        }

        public Criteria andLessonidBetween(Integer value1, Integer value2) {
            addCriterion("lessonid between", value1, value2, "lessonid");
            return (Criteria) this;
        }

        public Criteria andLessonidNotBetween(Integer value1, Integer value2) {
            addCriterion("lessonid not between", value1, value2, "lessonid");
            return (Criteria) this;
        }

        public Criteria andMidIsNull() {
            addCriterion("mid is null");
            return (Criteria) this;
        }

        public Criteria andMidIsNotNull() {
            addCriterion("mid is not null");
            return (Criteria) this;
        }

        public Criteria andMidEqualTo(Integer value) {
            addCriterion("mid =", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotEqualTo(Integer value) {
            addCriterion("mid <>", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidGreaterThan(Integer value) {
            addCriterion("mid >", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidGreaterThanOrEqualTo(Integer value) {
            addCriterion("mid >=", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidLessThan(Integer value) {
            addCriterion("mid <", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidLessThanOrEqualTo(Integer value) {
            addCriterion("mid <=", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidIn(List<Integer> values) {
            addCriterion("mid in", values, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotIn(List<Integer> values) {
            addCriterion("mid not in", values, "mid");
            return (Criteria) this;
        }

        public Criteria andMidBetween(Integer value1, Integer value2) {
            addCriterion("mid between", value1, value2, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotBetween(Integer value1, Integer value2) {
            addCriterion("mid not between", value1, value2, "mid");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}