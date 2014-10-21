## GET /api/users/:id
Returns the user.

### Example

#### Request
```
GET /api/users/1?uid=71493694-64e4-4627-9288-1e217eaed9cb HTTP/1.1
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
X-Request-Id: 6473786b-988b-4aaf-a3c0-0100bef5e79b
X-Runtime: 0.012425
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "test_user1",
  "screenName": "てすとゆーざ1",
  "image": null
}
```
