

# api 设计
## response
```text
{
    "code" : xxx,
    "msg": "xxxx",
    "data": {}
}
```
## user
```text
登录 POST: /api/user/sign_in
body: {
"username": ""
"pwd": ""
}
注册 POST: /api/user/sign_up
body: {
name,
email,
phone,
avatar,
pwd

}
```


## house
```text
Create : POST: /api/house/create

Query: 
    GET: /api/house/list
    GET: /api/house/detail
    
Update:
    POST: /api/house/update
    
Delete:
    POST: /api/house/delete

```
## search

```text
GET: api/search/house?keyword=xxxx

```