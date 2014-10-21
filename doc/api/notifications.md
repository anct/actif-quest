## GET /api/notifications
Returns the notifications.

### Example

#### Request
```
GET /api/notifications?uid=706dd5bb-6709-46b0-b15a-b8a2f3f1639d HTTP/1.1
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
Content-Length: 291
Content-Type: application/json; charset=utf-8
ETag: "39df77ffc20673c5125d4c6c2c10ccf6"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 77766ef3-53d4-4c0c-af3e-0eeaa7041789
X-Runtime: 0.009641
X-XSS-Protection: 1; mode=block

[
  {
    "id": 1,
    "content": "こころぴょん"
  },
  {
    "id": 2,
    "content": "こころぴょんぴょん"
  },
  {
    "id": 3,
    "content": "こころぴょんぴょんぴょん"
  },
  {
    "id": 4,
    "content": "こころぴょんぴょんぴょんぴょん"
  },
  {
    "id": 5,
    "content": "こころぴょんぴょんぴょんぴょんぴょん"
  }
]
```
