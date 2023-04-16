-- 処理01
INSERT INTO DEPARTMENT
  (
    DEPT_CODE
    , START_DATE
    , END_DATE
    , DEPT_NAME
    , LAYER
    , UP_DEPT_CODE
    , VALID_FLG
    , UPDATE_USER_NAME
    , USER_UPDATE_DATETIME
  )
  VALUES (
    "B300"
    , "2023-04-01"
    , NULL
    , "新設部門"
    , (
      SELECT LAYER
      FROM DEPARTMENT
      WHERE DEPT_CODE = "A100"
    )
    , (
      SELECT UP_DEPT_CODE
      FROM DEPARTMENT
      WHERE DEPT_CODE = "A100"
    )
    , "1"
    , (
      SELECT UPDATE_USER_NAME
      FROM DEPARTMENT
      WHERE DEPT_CODE = "A100"
    )
    , "2023-04-01 00:00:00"
  )
;

-- 処理02
UPDATE DEPARTMENT
SET
  END_DATE = "2023-03-31"
  , VALID_FLG = "0"
  , UPDATE_USER_NAME = "ORG_CHG"
  , USER_UPDATE_DATETIME = "2023-03-31 23:59:59"
WHERE
  DEPT_CODE = "A100"
  OR DEPT_CODE = "A200"
;

-- 処理03
UPDATE EMP
SET
  DEPT_CODE ="B300"
  , START_DATE = "2023-04-01"
  , UPDATE_USER_NAME = "ORG_CHG"
  , USER_UPDATE_DATETIME = "2023-04-01 00:00:00"
WHERE
  VALID_FLG = "1"
  AND (
    DEPT_CODE = "A100"
    OR DEPT_CODE = "A200"
  )
;