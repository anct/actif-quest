## GET /api/bounds
Returns the bounds.

### Example

#### Request
```
GET /api/bounds?uid=6e8ce02f-cd87-462c-9bee-31137374d678 HTTP/1.1
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
Content-Length: 131
Content-Type: application/json; charset=utf-8
ETag: "4c1d27a4932e52c83e1def5ee3ae7628"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 4c28ab2d-1c1e-467f-8321-0db163e551eb
X-Runtime: 0.008380
X-XSS-Protection: 1; mode=block

[
  {
    "id": 1,
    "name": "地点1"
  },
  {
    "id": 2,
    "name": "地点2"
  },
  {
    "id": 3,
    "name": "地点3"
  },
  {
    "id": 4,
    "name": "地点4"
  },
  {
    "id": 5,
    "name": "地点5"
  }
]
```
