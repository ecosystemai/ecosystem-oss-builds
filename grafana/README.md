## The process to setup Grafana datasource connector to ecosystem server

1. Use the JSON API source
2. Assign url for login http://customer.ecosystem.ai:3001/api/auth/login
3. Use basic auth and provide username password
4. Sign into swagger of the ecosystem server and generate a jwt token <key>
5. Setup a custom header with Authorization and Value of Bearer <key> 
