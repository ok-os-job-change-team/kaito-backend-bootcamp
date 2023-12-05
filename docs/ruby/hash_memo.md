# 【Ruby備忘録】 ハッシュとシンボル<a id="index" href="#index"></a>

### 目次
- [1. ハッシュ](#section1)
- [2. 要素の変更、追加、削除、取得](#section2)
- [3. ハッシュで使用するメソッド](#section3)
- [4. ハッシュと配列の変換](#section4)
- [5. シンボル](#section5)
- [参考文献](#section6)
---------
### <a id="section1" href="#section1">1. ハッシュ</a>  
- キーと値の組み合わせでデータを管理するオブジェクトのこと。
- ハッシュを作成する場合は以下のような構文(ハッシュリテラル)を使う。
- キーと値の組み合わせで1つの要素となる。
  ```ruby
  # キー(国)と値(通貨)の組み合わせ(要素)を3つ格納するハッシュ
  currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
  # ハッシュの要素は改行しても良い
  currencies = {
                'japan' => 'yen',
                'us' => 'dollar',
                'india' => 'rupee'
               }
  ```

### <a id="section2" href="#section2">2. 要素の変更、追加、削除、取得</a> 
#### ＜要素の変更＞
- キーを指定して値を代入することで、指定した値を変更できる。
  ```ruby
  currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
  # 既存の値を上書きして変更する
  currencies['japan'] = '円'
  currencies 
  # => { 'japan' => '円', 'us' => 'dollar', 'india' => 'rupee' }
  ```
#### ＜要素の追加＞
- ハッシュ[キー] = 値 で、要素を追加できる。
  ```ruby
  currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
  # イタリアの通貨を追加する
  currencies['itary'] = 'euro'
  currencies
  # => { 'japan' => '円', 'us' => 'dollar', 'india' => 'rupee', 'itary' => 'euro' }
  ```
#### ＜要素の削除＞
- deleteメソッドを使うと指定したキーの要素を削除できる。
- 戻り値は削除された要素の値となる。
  ```ruby
  currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
  # deleteメソッドで日本の通貨を削除する
  currencies.delete('japan')
  # => 'yen'
  currencies
  # => {'us' => 'dollar', 'india' => 'rupee' }
  ```
- 削除しようとしたキーが見つからない場合はnilが返る。
  ```ruby
  currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
  # deleteメソッドで存在しない要素を削除する
  currencies.delete('itary')
  # => 'nil'
  ```
#### ＜要素の取得＞
- ハッシュ[キー]で指定した要素を取り出す。
  ```ruby
  currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
  # インドの通貨を取得する
  currencies['india']
  # => 'rupee'
  ```
- 存在しないキーを指定した場合はnilが返る。
  ```ruby
  currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
  # 存在しないキーを指定する
  currencies['itary']
  # => nil
  ```

### <a id="section3" href="#section3">3. ハッシュで使用するメソッド</a>
#### ＜eachメソッド＞
- キーと値の組み合わせをハッシュに格納された順に取り出すことができる。
  ```ruby
  currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
  # ブロックパラメータにkeyとvalueを指定する
  currencies.each do |key, value|
    puts "#{key} : #{value}"
  end
  # => japan : yen
  #    us : dollar
  #    india : rupee
  ```
#### ＜keysメソッド＞
- ハッシュのキーを配列として返す。
  ```ruby
  currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
  # keysメソッドを実行
  currencies.keys
  # => ['japan', 'us', 'india']
  ```
#### ＜valuesメソッド＞
- ハッシュの値を配列として返す。
- エイリアスメソッドはfind_all
  ```ruby
  currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
  # valuesメソッドを実行
  currencies.values
  # => ['yen', 'dollar', 'rupee']
  ```
#### ＜has_key?メソッド＞
- ハッシュの中に指定したキーが存在するか確認するメソッド。
- 指定したキーが存在する場合はtrue、存在しない場合はfalseを返す。
- エイリアスメソッドに「key?」、「incllude?」、「member?」がある。
  ```ruby
  currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
  # has_key?メソッドを実行
  currencies.has_key?(:japan)
  # => true
  currencies.has_key?(:itary)
  # => false
  ```

### <a id="section4" href="#section4">4. ハッシュと配列の変換</a>
#### ＜ハッシュから配列への変換＞
- to_aメソッドを使うことでハッシュから配列に変換することができる。
  ```ruby
  currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
  # to_aメソッドを実行
  currencies.to_a
  # => [['japan', 'yen'],['us', 'dollar'],['india', 'rupee']]
  ```
#### ＜配列からハッシュへの変換＞
- to_hメソッドを使うことで配列からハッシュに変換することができる。
  ```ruby
  array = [['japan', 'yen'],['us', 'dollar'],['india', 'rupee']]
  # to_hメソッドを実行
  array.to_h
  # => { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
  ```

### <a id="section5" href="#section5">5. シンボル</a>
#### ＜シンボルと文字列＞
- シンボルはSybolクラスのオブジェクトとなる。
- 文字列はStringクラスのオブジェクトとなる。
  ```ruby
  :apple.class  # => Symbol
  'apple'.class # => String
  ```
- シンボルはRubyの内部で整数として管理されるため、2つの値を比較すると<br>文字列よりもシンボルのほうが高速に比較できる。
  ```ruby
  :apple == :apple
  'apple' == 'apple'
  ```
- 同じシンボルは同じオブジェクトとして処理されるため、メモリの使用効率が良い。
  ```ruby
  # 同じシンボルのobject_idを調べてみると一致することがわかる
  :apple.object_id #> 1143388
  :apple.object_id #> 1143388
  # 同じ文字列のobject_idを調べてみると異なることがわかる
  'apple'.object_id #> 70223819213380
  'apple'.object_id #> 70223819233120
  ```
- シンボルはイミューダブルなオブジェクトのため、破壊的な変更ができない。
  ```ruby
  # シンボルは破壊的な変更が不可能
  symbol = :apple
  symbol.upcase! #=> undefined method 'upcase!' for :apple:Symbol (NoMethodError)
  # 文字列は破壊的な変更が可能
  string = 'apple'
  string.upcase! #=> 'APPLE'
  ```
#### ＜シンボルの用途＞
- シンボルはプログラム上で名前を識別できるようにしたいが、その名前が<br>文字列である必要がない場合に使われる。
- ハッシュのキーにシンボルを使うと、文字列よりも高速に値を取り出すことができる。
```ruby
  currencies = { :japan => 'yen', :us => 'dollar', :india => 'rupee' }
  # シンボルを使って値を取り出す
  currencies[:japan] # => 'yen'
```
- プログラム上で区分や状態を管理するときにも、シンボルがよく使われる。
```ruby
# タスクの状態を整数値で管理する（処理効率は良いが、可読性が低い）
status = 2

case status
when 0 # todo
 'これからやります'
when 1 # doing
 '今やってます'
when 2 # done
 '終わりました'
end
# => '終わりました'

# タスクの状態をシンボルで管理する（処理効率が良く、可読性も高い）
status = :done

case status
when :todo
 'これからやります'
when :doing
 '今やってます'
when :done
 '終わりました'
end
# => '終わりました'
```

### <a id="section6" href="#section6">参考文献</a>
- プロを目指す人のためのRuby入門 5章「ハッシュや配列を理解する」

### [ページTOPに戻る](#index)
