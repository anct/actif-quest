## GET /api/exhibitions
Returns the exhibitions.

### Example

#### Request
```
GET /api/exhibitions?uid=84105924-6b6d-4986-a6d5-e2e63a0936ba HTTP/1.1
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
X-Request-Id: 03be811b-e944-4110-b4e6-780b934b3146
X-Runtime: 0.013735
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
GET /api/exhibitions/1?uid=c9060ac0-13da-45f8-9ad4-a3ce13b2e834 HTTP/1.1
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
Content-Length: 148
Content-Type: application/json; charset=utf-8
ETag: "a9ef8e96ddd5beb43b6873961578ffe7"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: c0d7df00-5f58-4a2f-b1fb-762f2f319713
X-Runtime: 0.006305
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "展示6",
  "introduction": "こころぴょんぴょんぴょんぴょんぴょんぴょん",
  "image": null,
  "group": {
    "id": 1,
    "name": "1E"
  }
}
```
