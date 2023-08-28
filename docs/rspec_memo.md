## RSpecの使い方
### RSpecを実行する方法
- カレントディレクトリはspecフォルダのあるところでコマンド実行すること
- `bundle exec rspec`コマンドで実行
  - コマンドの後ろに`ファイルパス`をつけることで特定のファイルのみ実行可能
  - ファイルパスの後ろに`:行数`をつけることで任意の行のテストのみ実行可能
- 実行例
  - `spec`フォルダの`test_favorite.rb`ファイルの`7`行目を実行
    ```bash
    $ bundle exec rspec spec/test_favorite.rb:7
    Run options: include {:locations=>{"./spec/test_favorite.rb"=>[7]}}

    Randomized with seed 12147

    Favorite
      #present?
        idが存在するとき
          trueになる

    Top 1 slowest examples (0.00242 seconds, 30.2% of total time):
      Favorite#present? idが存在するとき trueになる
        0.00242 seconds ./spec/test_favorite.rb:7

    Finished in 0.00803 seconds (files took 0.23601 seconds to load)
    1 example, 0 failures
    ```
