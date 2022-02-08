# 03-1 SELECT ~ FROM ~ WHERE
- SELECT 문은 구축이 완료된 테이블에서 데이터를 추출하는 기능을 한다.
- 그러므로 기존의 데이터를 변경하지는 않는다.

## 기본 조회하기:SELECT ~ FROM
- USE문:SELECT 문을 실행하려면 먼저 사용할 데이터베이스를 지정해야 한다.
```sql
USE 데이터베이스_이름;

- SELECT 문의 기본 형식
```sql
SELECT 열_이름
  FROM 테이블_이름
  WHERE 조건식
```
- SELECT와 FROM
```sql
SELECT * FROM member;
```

## 특정한 조건만 조회하기:SELECT ~ FROM ~ WHERE
- 기본적인 WHERE 절:WHERE절은 조회하는 결과에 특정한 조건을 추가해서 원하는 데이터만 보고 싶을 때 사용한다.
```sql
SELECT 열_이름 FROM 테이블_이름 WHERE 조건식;
```
- 관계 연산자, 논리 연산자의 사용
```sql
SELECT mem_id, mem_name FROM member WHERE height<=162;
```
- BETWEEN ~ AND:범위에 있는 값을 구하는 경우에는 BETWEEN ~ AND가 더 편하다.
```sql
SELECT mem_name, height FROM member WHERE height BETWEEN 163 AND 165;
```
- IN() : 조건식에서 여러 문자 중 하나에 포함되는지 확인할 때 사용한다.

- LIKE:문자열의 일부 글자를 검색할 때 사용한다.(% , __)


