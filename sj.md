## 组内生产环境服务部署升级记录  

### 初次上线  

时间:2019/05/10
上线内容:Leviatom,streamnet,NetCoin
上线结果：可以通过前台页面执行上述功能

### 服务升级

时间:2019/05/24
上线内容：oauth(server,client),mysql
上线结果：能够通过登陆界面有权限的跳转到streamnet访问界面，在2019/05/27发现通过界面不能进行transaction,原因是启动没有启动go服务造成的，2019/05/27下午服务已恢复，可以通过oauth实现登陆权限控制,streamnet服务正常
