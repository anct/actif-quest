## GET /api/notifications
Returns the notifications.

### Example

#### Request
```
GET /api/notifications?uid=a329ca94-e7c9-408f-a873-81fce411686a HTTP/1.1
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
X-Request-Id: 1e5026da-8b4e-445a-ae6d-238bd30e6d97
X-Runtime: 0.010449
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
