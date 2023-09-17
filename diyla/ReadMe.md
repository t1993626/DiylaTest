# Diyla

## 模組說明

- common - 共用程式碼  
  例如: DAO、Model、Utils
- diyla_front - 前台程式碼  
  例如: 前台的 JSP、Servlet
- diyla_back - 後台程式碼  
  例如: 後台的 JSP、Servlet

## 添加lib
- 在欲使用之module之<dependencies>區塊內添加dependency (添加前請確定版本)
- ex: 利用關鍵字 lib名稱 + maven (ex: mysql + maven)，於maven網站找到mysql的依賴如下
``` xml
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.33</version>
</dependency>
```
- reload project
## 參考網站

- [初探Maven](https://coffee0127.notion.site/Maven-785d9e8ddf2c42e2997606dab276ecfe)
- [如何使用 Apache Maven 管裡多個模組的專案 (Multi-Module Project)](https://blog.miniasp.com/post/2022/09/13/Multi-Module-Project-with-Apache-Maven)
