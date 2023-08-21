CREATE TABLE products
(
  product_id     CHAR(4)      NOT NULL,
  product_name    VARCHAR(100) NOT NULL,
  product_classification VARCHAR(32)  NOT NULL,
  unit_selling_price  INTEGER ,
  purchase_unit_price  INTEGER ,
  registration_date      DATE ,
  PRIMARY KEY (product_id)
);

START TRANSACTION;

INSERT INTO products VALUES ('0001', 'ペンチ' ,'日用品', 1000, 500, '2009-09-20');
INSERT INTO products VALUES ('0002', 'チーズケーキ' ,'食品', 500, 320, '2009-09-11');
INSERT INTO products VALUES ('0003', 'スポンジ' ,'日用品', 4000, 2800, NULL);
INSERT INTO products VALUES ('0004', '電子レンジ' ,'電化製品', 3000, 2800, '2009-09-20');
INSERT INTO products VALUES ('0005', 'バファリン' ,'薬品', 6800, 5000, '2009-01-15');
INSERT INTO products VALUES ('0006', 'ナプキン' ,'生理用品', 500, NULL, '2009-09-20');
INSERT INTO products VALUES ('0007', 'ハム' ,'食品', 880, 790, '2008-04-28');
INSERT INTO products VALUES ('0008', '君たちはどう生きるか？' ,'書籍', 2100, NULL, '2009-11-11');
INSERT INTO products VALUES ('0009', '正露丸' ,'薬品',700, NULL, '2009-11-11');
INSERT INTO products VALUES ('0010', 'トイレットペーパー' ,'生理用品', 500, NULL, '2009-09-20');
INSERT INTO products VALUES ('0011', 'シーチキン缶' ,'食品', 880, 790, '2008-04-28');
INSERT INTO products VALUES ('0012', 'プロになるためのruby入門' ,'書籍', 4000, NULL, '2009-11-11');
INSERT INTO products VALUES ('0013', 'プロになるためのTypeScript入門' ,'書籍', 3400, NULL, '2009-11-11');
INSERT INTO products VALUES ('0014', '包丁' ,'キッチン用品', 3000, NULL, '2009-11-11');
INSERT INTO products VALUES ('0015', '卸金' ,'キッチン用品', 880, NULL, '2009-11-11');

COMMIT;

-- 全てのレコードのカラムを表示する。
-- SELECT * FROM products;

-- テーブルを削除したいとき。
-- DROP TABLE products;
