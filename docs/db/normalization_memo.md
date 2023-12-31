# 【DB備忘録】 正規化<a id="index" href="#index"></a>

### 目次
- [1. テーブルとは](#section1)
- [2. 第1正規形](#section2)
- [3. 第2正規形/部分関数従属](#section3)
- [4. 第3正規形/推移的関数従属](#section4)
- [5. まとめ](#section5)
- [参考文献](#section_6)
---------
### <a id="section1" href="#section1">1. RDBにおけるテーブル</a>  
#### ＜テーブルとは＞
- リレーショナルデータベース(RDB)におけるテーブルとは共通点を持ったレコードの集合である。
- テーブル名は全て英語ならば複数形/複数代名詞で書ける。
  - (例)商品を集めたテーブルならば「Items」、注文履歴ならば「Orders」
  - もし、複数形で書くことができないならば、テーブルに間違いがある。

#### ＜テーブルの構成要素＞
- 行を「レコード」、列を「カラム」と呼ぶ。
- 主キー(プライマリーキー)
  - テーブルに必ず1つ存在し、レコードを一意に識別することができる。
  - 複数のカラムを組み合わせなければレコードを一意に識別できない場合は、<br>複合キーが使われる。
- 外部キー
  - 異なるテーブル間の関係を確立するためのキー。
  - あるテーブルのカラムを他のテーブルの主キーと関連させることで、テーブル間で<br>データの整合性を保持ことができる。
- 主キー/外部キーにはコードIDや表記体系の決まった固定長文字列を用いるのが基本。

#### ＜制約＞
- NOT NULL制約
  - DBにデータを登録する際、NULLを許容しないようにする制約。
  - テーブル定義において、カラムには可能な限りNOT NULL制約を設定するべきである。
- 一意制約
  - あるカラムの組について一意性を求める制約。
  - 主キーはテーブルに1つしか設定できないが、一意制約は何個でも設定できる。
- CHECK制約
  - あるカラムについてデータ型やデータ長の制約を設定できる。

#### ＜テーブルとカラムの名前＞
- 基本的にテーブルとカラムの名前には「半角英数字」と「アンダーバー」しか使用できない。
- 名前の先頭は「英字」で始めなければならない。
- 同じ名前を使用してはならない。

### <a id="section2" href="#section2">2. 第1正規形</a> 
#### ＜正規形＞
- 正規形とはDBに保持するデータの冗長性を排除し、一貫性と効率性を保持する<br>ためのデータ形式。
- 正規形のレベルは第5まであるが、通常は第3正規形まで考えることが多い。 
- 正規化は可逆的な操作であり、非正規形と正規形を比較しても情報の損失はない。

#### ＜第1正規形＞
- 1つのセルには1つの値しか含めてはならない。
- セルに複数の値を入れることを許容すると、主キーが各カラムの値を一意に特定<br>できなくなるため。

### <a id="section3" href="#section3">3. 第2正規形/部分関数従属</a> 
#### ＜第2正規形＞
- 第2正規形は部分関数従属を解消することで得られる。
  - 部分関数従属となっているキー列と従属列だけを独立のテーブルにすることで解消できる。
- 部分関数従属
  - 主キーの一部のカラムに対して従属する列がある場合、この関係を部分関数従属と呼ぶ。
- 完全関数従属
  - 主キーを構成するすべての列に従属性がある場合を完全関数従属と呼ぶ。

### <a id="section4" href="#section4">4. 第3正規形/推移的関数従属</a>
#### ＜第3正規形＞
- 第3正規形は推移的関数従属を解消することで得られる。
  - 推移関数従属となっているキー列と従属列だけを独立のテーブルにすることで解消できる。
- 推移的関数従属
  - テーブルの内部に存在する段階的な関数従属のこと
  - (例) {部署CD} -> {部署名} 、{会社CD, 社員ID} -> {部署CD}という2つの従属関係があるとき、<br>全体としては{会社CD, 社員ID} -> {部署CD} -> {部署名}という従属関係がある。

### <a id="section5" href="#section5">5. まとめ</a>
#### ＜正規化におけるポイント＞
- 正規化とはデータ更新時の不都合、不整合を排除するために行う。
- 正規化は従属性を見抜くことで可能になる。
- 正規化は可逆的であり、いつでも非正規形に戻すことができる。
- 第3正規形までの正規化は原則として行う。

#### ＜正規化によるメリット/デメリット＞
- メリット
  - データの冗長性が排除され、更新時の不整合が防止できる。
  - テーブルの持つ意味が明確となり、開発者が理解しやすい。
- デメリット
  - テーブルの数が増えるため、SQL文で結合を多用することになり、<br>パフォーマンスが悪化する。

### <a id="section6" href="#section6">参考文献</a>
- 達人に学ぶDB設計徹底指南書<br>第3章「論理設計と正規化～なぜテーブルは分割する必要があるのか？」

### [ページTOPに戻る](#index)
