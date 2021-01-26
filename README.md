# nodejsHestabit
# Database attached in test.sql file which is located into root directory,
# run npm install

API 1 : 
http://localhost:3000/api/get-users-code/abcd 
{"data":[{"id":3,"name":"Mathur","invite_code":"abcd"},{"id":4,"name":"Sanjay","invite_code":"abcd"}]}


API 2 : 
http://localhost:3000/api/get-users-with-friends
{"data":{"1":{"id":1,"name":"Aniket","freind":["Vivek","Mathur"]},"2":{"id":2,"name":"Vivek","freind":[]},"3":{"id":3,"name":"Mathur","freind":["Sanjay"]},"4":{"id":4,"name":"Sanjay","freind":[]}}}
