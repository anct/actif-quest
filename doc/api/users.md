## GET /api/users/:id
Returns the user.

### Example

#### Request
```
GET /api/users/1?uid=2d76b7b6-d0ea-4026-a17c-ff582d3abae7 HTTP/1.1
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
Content-Length: 76
Content-Type: application/json; charset=utf-8
ETag: "29899aa56c14522c3ab932109ca2127a"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: a029fb30-7922-4151-8fc1-4f8e372a52f5
X-Runtime: 0.011588
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "test_user1",
  "screenName": "てすとゆーざ1",
  "image": null
}
```
