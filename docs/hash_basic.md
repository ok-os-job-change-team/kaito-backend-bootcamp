## Hash.[]について
- https://docs.ruby-lang.org/ja/latest/method/Hash/s/=5b=5d.html

## Hashのアクセス方法
### keyがStringのハッシュ
```ruby
hash = {
  'key' => 'value'
}
hash['key']
```

### keyがSymbolのハッシュ
```ruby
hash = {
  key: 'value'
}

hash[:key]
```
