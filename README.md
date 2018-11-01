# PE-JavaWeb-Practice-SE1209


Model–view–controller architectural pattern in JAVA WEB

Model: DAO -> DBContect -> Entity -> Attribute
View: JSP
Controller: Servlet

When a request is sent to server:
1. Controller revices request
2. Controller calls DAO to get data
3. Controller passes data to view by "set attribute" for request
4. View revices data -> generate "html" based on data -> send to client -> display
