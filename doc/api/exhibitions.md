## GET /api/exhibitions
Returns the exhibitions.

### Example

#### Request
```
GET /api/exhibitions?uid=f6bb61c3-7e70-4dba-89d3-4f4dc4f06f24 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Token token=test_token
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 681
Content-Type: application/json; charset=utf-8
ETag: "0d8b855f326c40bc71392d47eda229d8"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: bfc6bb9b-de20-4441-bebe-8c88d8cbca7d
X-Runtime: 0.014271
X-XSS-Protection: 1; mode=block

[
  {
    "id": 1,
    "name": "展示1",
    "introduction": "こころぴょん",
    "image": null,
    "group": {
      "id": 1,
      "name": "情報工学研究部"
    }
  },
  {
    "id": 2,
    "name": "展示2",
    "introduction": "こころぴょんぴょん",
    "image": null,
    "group": {
      "id": 2,
      "name": "GCC"
    }
  },
  {
    "id": 3,
    "name": "展示3",
    "introduction": "こころぴょんぴょんぴょん",
    "image": null,
    "group": {
      "id": 3,
      "name": "視覚メディア研究部"
    }
  },
  {
    "id": 4,
    "name": "展示4",
    "introduction": "こころぴょんぴょんぴょんぴょん",
    "image": null,
    "group": {
      "id": 4,
      "name": "ロボット工学研究部"
    }
  },
  {
    "id": 5,
    "name": "展示5",
    "introduction": "こころぴょんぴょんぴょんぴょんぴょん",
    "image": null,
    "group": {
      "id": 5,
      "name": "1M"
    }
  }
]
```

## GET /api/exhibitions/:id
Returns the exhibition.

### Example

#### Request
```
GET /api/exhibitions/1?uid=6d308251-f7a8-460f-ad32-747261b6224b HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Token token=test_token
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 194
Content-Type: application/json; charset=utf-8
ETag: "01fed997fc008c6374138e6358130be2"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: fff7eae9-dcd3-4a03-8835-2f90f93f3802
X-Runtime: 0.005773
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "展示11",
  "introduction": "こころぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょん",
  "image": null,
  "group": {
    "id": 1,
    "name": "2C"
  }
}
```

## POST /api/exhibitions/:id/vote
Returns 201 created.

### Example

#### Request
```
POST /api/exhibitions/1/vote HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Token token=test_token
Content-Length: 40
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

uid=7d35ad2b-624c-47b1-b859-57761af17bc5
```

#### Response
```
HTTP/1.1 201
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 4
Content-Type: application/json; charset=utf-8
ETag: "b326b5062b2f0e69046810717534cb09"
Set-Cookie: request_method=POST; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 8a17e0aa-e0af-449e-a0c6-6708fff1631c
X-Runtime: 0.018260
X-XSS-Protection: 1; mode=block
```
