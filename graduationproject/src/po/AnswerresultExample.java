package po;

import java.util.ArrayList;
import java.util.List;

public class AnswerresultExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AnswerresultExample() {
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

        public Criteria andSturesultidIsNull() {
            addCriterion("sturesultid is null");
            return (Criteria) this;
        }

        public Criteria andSturesultidIsNotNull() {
            addCriterion("sturesultid is not null");
            return (Criteria) this;
        }

        public Criteria andSturesultidEqualTo(Integer value) {
            addCriterion("sturesultid =", value, "sturesultid");
            return (Criteria) this;
        }

        public Criteria andSturesultidNotEqualTo(Integer value) {
            addCriterion("sturesultid <>", value, "sturesultid");
            return (Criteria) this;
        }

        public Criteria andSturesultidGreaterThan(Integer value) {
            addCriterion("sturesultid >", value, "sturesultid");
            return (Criteria) this;
        }

        public Criteria andSturesultidGreaterThanOrEqualTo(Integer value) {
            addCriterion("sturesultid >=", value, "sturesultid");
            return (Criteria) this;
        }

        public Criteria andSturesultidLessThan(Integer value) {
            addCriterion("sturesultid <", value, "sturesultid");
            return (Criteria) this;
        }

        public Criteria andSturesultidLessThanOrEqualTo(Integer value) {
            addCriterion("sturesultid <=", value, "sturesultid");
            return (Criteria) this;
        }

        public Criteria andSturesultidIn(List<Integer> values) {
            addCriterion("sturesultid in", values, "sturesultid");
            return (Criteria) this;
        }

        public Criteria andSturesultidNotIn(List<Integer> values) {
            addCriterion("sturesultid not in", values, "sturesultid");
            return (Criteria) this;
        }

        public Criteria andSturesultidBetween(Integer value1, Integer value2) {
            addCriterion("sturesultid between", value1, value2, "sturesultid");
            return (Criteria) this;
        }

        public Criteria andSturesultidNotBetween(Integer value1, Integer value2) {
            addCriterion("sturesultid not between", value1, value2, "sturesultid");
            return (Criteria) this;
        }

        public Criteria andQuestionidIsNull() {
            addCriterion("questionid is null");
            return (Criteria) this;
        }

        public Criteria andQuestionidIsNotNull() {
            addCriterion("questionid is not null");
            return (Criteria) this;
        }

        public Criteria andQuestionidEqualTo(Integer value) {
            addCriterion("questionid =", value, "questionid");
            return (Criteria) this;
        }

        public Criteria andQuestionidNotEqualTo(Integer value) {
            addCriterion("questionid <>", value, "questionid");
            return (Criteria) this;
        }

        public Criteria andQuestionidGreaterThan(Integer value) {
            addCriterion("questionid >", value, "questionid");
            return (Criteria) this;
        }

        public Criteria andQuestionidGreaterThanOrEqualTo(Integer value) {
            addCriterion("questionid >=", value, "questionid");
            return (Criteria) this;
        }

        public Criteria andQuestionidLessThan(Integer value) {
            addCriterion("questionid <", value, "questionid");
            return (Criteria) this;
        }

        public Criteria andQuestionidLessThanOrEqualTo(Integer value) {
            addCriterion("questionid <=", value, "questionid");
            return (Criteria) this;
        }

        public Criteria andQuestionidIn(List<Integer> values) {
            addCriterion("questionid in", values, "questionid");
            return (Criteria) this;
        }

        public Criteria andQuestionidNotIn(List<Integer> values) {
            addCriterion("questionid not in", values, "questionid");
            return (Criteria) this;
        }

        public Criteria andQuestionidBetween(Integer value1, Integer value2) {
            addCriterion("questionid between", value1, value2, "questionid");
            return (Criteria) this;
        }

        public Criteria andQuestionidNotBetween(Integer value1, Integer value2) {
            addCriterion("questionid not between", value1, value2, "questionid");
            return (Criteria) this;
        }

        public Criteria andStuanswerIsNull() {
            addCriterion("stuanswer is null");
            return (Criteria) this;
        }

        public Criteria andStuanswerIsNotNull() {
            addCriterion("stuanswer is not null");
            return (Criteria) this;
        }

        public Criteria andStuanswerEqualTo(String value) {
            addCriterion("stuanswer =", value, "stuanswer");
            return (Criteria) this;
        }

        public Criteria andStuanswerNotEqualTo(String value) {
            addCriterion("stuanswer <>", value, "stuanswer");
            return (Criteria) this;
        }

        public Criteria andStuanswerGreaterThan(String value) {
            addCriterion("stuanswer >", value, "stuanswer");
            return (Criteria) this;
        }

        public Criteria andStuanswerGreaterThanOrEqualTo(String value) {
            addCriterion("stuanswer >=", value, "stuanswer");
            return (Criteria) this;
        }

        public Criteria andStuanswerLessThan(String value) {
            addCriterion("stuanswer <", value, "stuanswer");
            return (Criteria) this;
        }

        public Criteria andStuanswerLessThanOrEqualTo(String value) {
            addCriterion("stuanswer <=", value, "stuanswer");
            return (Criteria) this;
        }

        public Criteria andStuanswerLike(String value) {
            addCriterion("stuanswer like", value, "stuanswer");
            return (Criteria) this;
        }

        public Criteria andStuanswerNotLike(String value) {
            addCriterion("stuanswer not like", value, "stuanswer");
            return (Criteria) this;
        }

        public Criteria andStuanswerIn(List<String> values) {
            addCriterion("stuanswer in", values, "stuanswer");
            return (Criteria) this;
        }

        public Criteria andStuanswerNotIn(List<String> values) {
            addCriterion("stuanswer not in", values, "stuanswer");
            return (Criteria) this;
        }

        public Criteria andStuanswerBetween(String value1, String value2) {
            addCriterion("stuanswer between", value1, value2, "stuanswer");
            return (Criteria) this;
        }

        public Criteria andStuanswerNotBetween(String value1, String value2) {
            addCriterion("stuanswer not between", value1, value2, "stuanswer");
            return (Criteria) this;
        }

        public Criteria andRightorwrongIsNull() {
            addCriterion("rightorwrong is null");
            return (Criteria) this;
        }

        public Criteria andRightorwrongIsNotNull() {
            addCriterion("rightorwrong is not null");
            return (Criteria) this;
        }

        public Criteria andRightorwrongEqualTo(String value) {
            addCriterion("rightorwrong =", value, "rightorwrong");
            return (Criteria) this;
        }

        public Criteria andRightorwrongNotEqualTo(String value) {
            addCriterion("rightorwrong <>", value, "rightorwrong");
            return (Criteria) this;
        }

        public Criteria andRightorwrongGreaterThan(String value) {
            addCriterion("rightorwrong >", value, "rightorwrong");
            return (Criteria) this;
        }

        public Criteria andRightorwrongGreaterThanOrEqualTo(String value) {
            addCriterion("rightorwrong >=", value, "rightorwrong");
            return (Criteria) this;
        }

        public Criteria andRightorwrongLessThan(String value) {
            addCriterion("rightorwrong <", value, "rightorwrong");
            return (Criteria) this;
        }

        public Criteria andRightorwrongLessThanOrEqualTo(String value) {
            addCriterion("rightorwrong <=", value, "rightorwrong");
            return (Criteria) this;
        }

        public Criteria andRightorwrongLike(String value) {
            addCriterion("rightorwrong like", value, "rightorwrong");
            return (Criteria) this;
        }

        public Criteria andRightorwrongNotLike(String value) {
            addCriterion("rightorwrong not like", value, "rightorwrong");
            return (Criteria) this;
        }

        public Criteria andRightorwrongIn(List<String> values) {
            addCriterion("rightorwrong in", values, "rightorwrong");
            return (Criteria) this;
        }

        public Criteria andRightorwrongNotIn(List<String> values) {
            addCriterion("rightorwrong not in", values, "rightorwrong");
            return (Criteria) this;
        }

        public Criteria andRightorwrongBetween(String value1, String value2) {
            addCriterion("rightorwrong between", value1, value2, "rightorwrong");
            return (Criteria) this;
        }

        public Criteria andRightorwrongNotBetween(String value1, String value2) {
            addCriterion("rightorwrong not between", value1, value2, "rightorwrong");
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