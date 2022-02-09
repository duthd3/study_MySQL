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

# 03-2 SELECT문 심화
- SELECT 문에서는 결과의 정렬을 위한 `ORDER BY`, 결과의 개수를 제한하는 `LIMIT`, 중복된 데이터를 제거하는 `DISTINCT`등을 사용할 수 있다.
- `GROUP BY` 절은 지정한 열의 데이터들을 같은 데이터끼리는 묶어서 결과를 추출한다.
- `HAVING` 절은 `WHERE`절과 비슷하지만, `GROUP BY` 절과 함께 사용된다.
```sql
SELECT 열_이름
    FROM 테이블_이름
    WHERE 조건식
    GROUP BY 열_이름
    HAVING 조건식
    ORDER BY 열_이름
    LIMIT 숫자
```
- 위 순서대로 쿼리를 작성해야 한다(순서틀리면 에러 발생!)

## ORDER BY 절
- ORDER BY 절은 결과의 값이나 개수에 대해서는 영향을 미치지 않지만, 결과가 출력되는 `순서`를 조절한다.
- 기본값은 ASC(오름차순), 내림차순은 DESC.
- 정렬 기준은 1개 열이 아니라
