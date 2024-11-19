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
UPDATE reports SET person_id = 11 WHERE report_id = 1;
UPDATE reports SET person_id = 3 WHERE report_id = 2;
UPDATE reports SET person_id = 12 WHERE report_id = 3;
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


/*問題3勘違い更に新規5人追加(今までの人の合わせてトータル10人だと思っていました
。)*/
INSERT INTO people (name, email, department_id, age, gender)
  ('上山司', 'tukasa@gizumo.co.jp', 1, 24, 1),
  ('直本はるき', 'haru@gizumo.co.jp', 2, 27, 1),
　('仲谷遼太郎', 'nakatani@gizumo.co.jp', 1, 31, 1),
  ('田崎すい', 'sui@gizumo.co.jp', 4, 24, 2),
  ('峰かんた', 'kanta@gizumo.co.jp', 1, 28, 1);

/*問題3勘違い更にレポート追加*/
INSERT INTO reports (person_id,content)
-> VALUES
    -> (11,'今日の作業は会議資料の作成をした。'),
    -> (17,'本日は遠山さんの作業を手伝いました。'),
    -> (13,'本日は風邪ひいたので早退しました。'),
    -> (16,'今日一日は現場で作業をし、遅れを補填いたしました。'),
    -> (13,'本日は役所で手続きをし、マイナンバーカードを発行いたしました。'),
    -> (16,'今日は来週の海外出張に向けて英語を覚えました。'),
    -> (8,'今日は社内の開発と会議の資料制作をしました。'),
    -> (13,'本日は社長室と専務室に呼び出されました。すいませんでした。'),
    -> (9,'今日はリモートワークで自分のペースでカリキュラムを進められました。'),
    -> (12,'本日からゲーム会社に派遣となりました。');


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


/*Q7.*/
SELECT name, age, gender FROM people WHERE gender = 2 AND 20 <= age AND age <= 30 || gender = 1 AND 40 <= age;


/*Q8.*/
 SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;

/*Q9.*/
SELECT AVG(age) AS average_age FROM people WHERE gender=2;


/*Q10.*/
SELECT people.name,people.department_id,reports.content
  FROM people INNER JOIN reports ON people.person_id = reports.person_id;


/*Q11.*/
SELECT people.name FROM people LEFT OUTER JOIN reports
ON people.person_id = reports.person_id
WHERE reports.content IS NULL;

