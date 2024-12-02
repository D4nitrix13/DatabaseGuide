<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# Hashes

Estructura

```json
{
    title: 'Name of the Wind',
    rating: '9',
    autor: 'Daniel Perez'
}
```

127.0.0.1:6379> HSET books:1 title "Name of the Wind"
(integer) 1

127.0.0.1:6379> HSET books:1 author "Batman"
(integer) 1

127.0.0.1:6379> HSET books:1 rating 9
(integer) 1

127.0.0.1:6379> HSET books:1 rating 10
(integer) 0

127.0.0.1:6379> HSET books:2 title "A wise man's fear" author "Robin" rating 8
(integer) 3

127.0.0.1:6379> HGET books:1 title
"Name of the Wind"

127.0.0.1:6379> HGETALL books:2

1) "title"
2) "A wise man's fear"
3) "author"
4) "Robin"
5) "rating"
6) "8"

127.0.0.1:6379> HEXISTS books:1 title
(integer) 1
127.0.0.1:6379> HEXISTS books:1 Song
(integer) 0

127.0.0.1:6379> HKEYS books:2

1) "title"
2) "author"
3) "rating"

127.0.0.1:6379> HDEL books:1 author
(integer) 1

127.0.0.1:6379> DEL books:1
(integer) 1

127.0.0.1:6379> HGETALL books:1
(empty array)

127.0.0.1:6379> HVALS books:2

1) "A wise man's fear"
2) "Robin"
3) "8"

docs <https://redis.io/docs/latest/commands/?group=hash>
