/*Q1.*/
CREATE TABLE departments (
    -> department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(20) NOT NULL,
    -> created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -> updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -> );
  

/*Q2.*/
ALTER TABLE people add department_id INT UNSIGNED after email;


/*Q3.*/
INSERT INTO departments (name)
    -> VALUES
    -> ('営業'),
    -> ('開発'),
    -> ('経理'),
    -> ('人事'),
    -> ('情報システム');


/*reportsの元あったデータ番号を振りなおす処理*/
UPDATE reports SET person_id = 5 WHERE report_id = 1;
UPDATE reports SET person_id = 3 WHERE report_id = 2;
UPDATE reports SET person_id = 7 WHERE report_id = 3;
UPDATE reports SET person_id = 4 WHERE report_id = 4;
UPDATE reports SET person_id = 10 WHERE report_id = 5;
UPDATE reports SET person_id = 8 WHERE report_id = 6;
UPDATE reports SET person_id = 1 WHERE report_id = 7;
UPDATE reports SET person_id = 6 WHERE report_id = 8;
UPDATE reports SET person_id = 9 WHERE report_id = 9;
UPDATE reports SET person_id = 2 WHERE report_id = 10;

/*新規5人追加*/
INSERT INTO people (name, email, department_id, age, gender)
  ('山田駿', 'yamada@gizumo.co.jp', 1, 54, 1),
  ('白川かずま', 'kazumax@gizumo.co.jp', 2, 24, 1),
　('佐藤健', 'takerux@gizumo.co.jp', 1, 35, 1),
  ('須貝雪奈', 'gorira@gizumo.co.jp', 4, 24, 2),
  ('大野龍也', 'ryux@gizumo.co.jp', 1, 24, 1);


/*Q4.*/
/*今までいた人にもdepartment_idを振り分け*/
 UPDATE people SET department_id = 3 WHERE person_id = 1;
 UPDATE people SET department_id = 2 WHERE person_id = 2;
 UPDATE people SET department_id = 5 WHERE person_id = 3;
 UPDATE people SET department_id = 2 WHERE person_id = 4;
 UPDATE people SET department_id = 2 WHERE person_id = 6;



/*Q5.*/
SELECT  name, age, gender FROM people WHERE gender = 1 ORDER BY age DESC;


/*Q6.*/
SELECT --セレクトで表示したい必要な情報を取得
  `name`, `email`, `age`
FROM --取得したいテーブルの指定
  `people`
WHERE --特定のレコードのみの取得
  `department_id` = 1
ORDER BY --ソート。DESCを使用すると、降順になるが指定がないので昇順となる。
  `created_at`;