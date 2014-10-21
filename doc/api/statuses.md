## GET /api/statuses
Returns the statuses.

### Example

#### Request
```
GET /api/statuses?uid=b67aadfc-5863-4b40-b733-25bd278cb16f HTTP/1.1
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
Content-Length: 751
Content-Type: application/json; charset=utf-8
ETag: "372293c21ad0d8f3eedb728b19135c4a"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 4ae79700-bbba-4ead-9b3a-28f2448b97d8
X-Runtime: 0.015798
X-XSS-Protection: 1; mode=block

[
  {
    "id": 5,
    "userId": 5,
    "body": "こころぴょんぴょんぴょんぴょんぴょん",
    "user": {
      "id": 5,
      "name": "test_user5",
      "screenName": "てすとゆーざ5",
      "image": null
    }
  },
  {
    "id": 4,
    "userId": 4,
    "body": "こころぴょんぴょんぴょんぴょん",
    "user": {
      "id": 4,
      "name": "test_user4",
      "screenName": "てすとゆーざ4",
      "image": null
    }
  },
  {
    "id": 3,
    "userId": 3,
    "body": "こころぴょんぴょんぴょん",
    "user": {
      "id": 3,
      "name": "test_user3",
      "screenName": "てすとゆーざ3",
      "image": null
    }
  },
  {
    "id": 2,
    "userId": 2,
    "body": "こころぴょんぴょん",
    "user": {
      "id": 2,
      "name": "test_user2",
      "screenName": "てすとゆーざ2",
      "image": null
    }
  },
  {
    "id": 1,
    "userId": 1,
    "body": "こころぴょん",
    "user": {
      "id": 1,
      "name": "test_user1",
      "screenName": "てすとゆーざ1",
      "image": null
    }
  }
]
```

## POST /api/statuses
Returns 201 created.

### Example

#### Request
```
POST /api/statuses HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Token token=test_token
Content-Length: 513
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

status[body]=%E3%81%93%E3%81%93%E3%82%8D%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93%E3%81%B4%E3%82%87%E3%82%93&uid=526498f4-a787-4ed0-ad75-2cc0c3f1a128
```

#### Response
```
HTTP/1.1 201
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 268
Content-Type: application/json; charset=utf-8
ETag: "2c29340fd797c00bf5b610158474219b"
Set-Cookie: request_method=POST; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: ebee0318-7788-4856-83c7-6ef8212de3a2
X-Runtime: 0.011154
X-XSS-Protection: 1; mode=block

{
  "id": 6,
  "userId": 6,
  "body": "こころぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょん",
  "user": {
    "id": 6,
    "name": "test_user17",
    "screenName": "てすとゆーざ17",
    "image": null
  }
}
```

## DELETE /api/statuses/:id
Returns 204 no content.

### Example

#### Request
```
DELETE /api/statuses/6 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Token token=test_token
Content-Length: 40
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

uid=d70601b8-fce3-4329-8bf9-fad5a51e3c66
```

#### Response
```
HTTP/1.1 204
Cache-Control: no-cache
Set-Cookie: request_method=DELETE; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 954e8685-272f-4cd9-b4dd-74c9f422c61f
X-Runtime: 0.022899
X-XSS-Protection: 1; mode=block
```

## POST /api/statuses/:id/favorites
Returns 201 created.

### Example

#### Request
```
POST /api/statuses/1/favorites HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Token token=test_token
Content-Length: 40
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

uid=4ef8d2e7-fdf1-4f1a-ad16-8c4f4fa97b83
```

#### Response
```
HTTP/1.1 201
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 205
Content-Type: application/json; charset=utf-8
ETag: "cab431e88b8c59d06eb2b9b7bc6be04a"
Set-Cookie: request_method=POST; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 18787a9b-2c5a-46e7-951b-13ea3ce2e989
X-Runtime: 0.018410
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "userId": 1,
  "body": "こころぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょんぴょん",
  "user": {
    "id": 1,
    "name": "test_user59",
    "screenName": "てすとゆーざ59",
    "image": null
  }
}
```

## DELETE /api/statuses/:id/favorites
Returns 204 no content.

### Example

#### Request
```
DELETE /api/statuses/1/favorites HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Token token=test_token
Content-Length: 40
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

uid=cd80e6f3-8db9-4695-b4dd-50e72d124193
```

#### Response
```
HTTP/1.1 204
Cache-Control: no-cache
Set-Cookie: request_method=DELETE; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 69988a2d-0cc3-410e-b630-18acb290cd23
X-Runtime: 0.006720
X-XSS-Protection: 1; mode=block
```
