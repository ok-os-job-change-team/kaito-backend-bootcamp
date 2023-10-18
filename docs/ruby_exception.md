# 【Ruby備忘録】 例外処理<a id="index" href="#index"></a>

### 目次
- [1. 例外の補足](#section1)
- [2. 意図的に例外を発生させる方法](#section2)
- [参考文献/参考URL](#section3)
---------
### <a id="section1" href="#section1">1. 例外の補足</a>  
#### ＜rescueメソッド＞
- 例外オブジェクトから情報を取得する方法
  ```ruby
  begin
    # 例外が発生するかもしれない処理
  rescue => exeption # 例外オブジェクトを格納する変数
    #例外が発生した場合の処理
  end
  ```
- クラスを指定して補足する例外を限定する方法
  ```ruby
  begin
    # 例外が発生するかもしれない処理
  rescue NameError # 補足したい例外クラス
    #例外が発生した場合の処理
  end
  ```
- 例外発生時にもう一度処理を実行する方法
  ```ruby
  begin
    # 例外が発生するかもしれない処理
  rescue 
    retry #beginから再実行
  end
  ```
  - 無条件に`retry`を使うと、例外が解決しない場合に無限ループとなるため、if文を用いて回数制限をするなどの処理が必要

#### ＜例外クラスの継承関係＞
- 例外クラスの継承関係
  ```
  Exception
  |
  |-- StandardError
  |   |
  |   |-- ArgumentError
  |   |
  |   |-- NameError
  |   |   |
  |   |   |-- NoMethodError
  |   |
  |   |-- TypeError
  |   |
  |   |-- RuntimeError
  |   |
  |   |-- その他の例外クラス
  |
  |-- NoMemoryError
  |
  |-- SystemExit
  |
  |-- その他の例外クラス
  ```
  - 全ての例外クラスはExceptionクラスを継承している
  - StandardErrorクラスは通常のプログラムで発生する可能性の高い例外クラスをサブクラスに持つ
  - StandardErrorクラスを継承していないクラスは通常のプログラムでは発生しない特殊なエラー
  - rescue節に例外クラスを指定すると、そのクラス自身とサブクラスが例外の捕捉対象となる

### <a id="section2" href="#section2">2. 意図的に例外を発生させる方法</a> 
#### ＜raiseメソッド＞
- raiseメソッドを使うことで、コード内で任意の例外を発生させることができる
  ``` ruby
    raise 発生させたい例外クラス, 'エラーメッセージ'
  ```
- 使用例
  ```ruby
  def odd_number?(number)
      # 整数であることを確認する
    if number.is_a?(Integer)
      # 2で割った余りが1なら奇数
      return number % 2 == 1
    else
      # 整数でない場合は例外を発生させる
      raise RuntimeError, "無効な引数です"
    end
  end
  ```
#### ＜throw/catchメソッド＞
- throwメソッドとcatchメソッドの組み合わせで、ネストの深いループから抜け出すことができる
- catchメソッドの引数はcatchしたいオブジェクト(通常はSymbol)を指定する
- throwメソッドの第一引数はcatchメソッドに指定したオブジェクト(通常はSymbol)を指定し、第二引数は戻り値を指定する
- throwメソッドの戻り値はcatchに渡される
  ``` ruby
    catch (:sample_tag) do
      throw :sample_tag, 戻り値
    end
  ```
- 使用例
  ```ruby
  # iが2回、ｊが3回呼び出されたとき、ループを抜ける
  message = catch(:break_loop) do
    3.times do |i|
      3.times do |j|
        puts "i, j = #{i}, #{j}"
        if i == 2 and j == 1
          throw :break_loop, 'ループ抜けたよ'
        end
      end
    end
  end

  puts message
  ```
  ```bash
  # 実行結果
  $ ruby sample.rb
  i, j = 0, 0
  i, j = 0, 1
  i, j = 0, 2
  i, j = 1, 0
  i, j = 1, 1
  i, j = 1, 2
  i, j = 2, 0
  i, j = 2, 1
  ループ抜けたよ
  ```

### <a id="section3" href="#section3">参考文献/参考URL</a>
- プロを目指す人のためのRuby入門_9章「例外処理を理解する」
- https://docs.ruby-lang.org/ja/latest/method/Kernel/m/throw.html
- https://qiita.com/harvath/items/e716179538bc1da30f88

### [ページTOPに戻る](#index)
