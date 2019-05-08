迁移的话，直接导出一个库的dmp文件，之后导入到另外一个库里面就可以了（导出和导入数据库版本必须一直，否则导入可能会报错）。

迁移数据导出：

  1 将数据库TEST完全导出,用户名system 密码manager 导出到D:\daochu.dmp中

    exp system/manager@TEST file=d:\daochu.dmp full=y

  2 将数据库中system用户与sys用户的表导出

    exp system/manager@TEST file=d:\daochu.dmp owner=(system,sys)
  3 将数据库中的表table1 、table2导出

    exp system/manager@TEST file=d:\daochu.dmp tables=(table1,table2) 

 4 将数据库中的表table1中的字段filed1以"00"打头的数据导出

    exp system/manager@TEST file=d:\daochu.dmp tables=(table1) query=\" where filed1 like  '00%'\"
迁移数据的导入

  1 将D:\daochu.dmp 中的数据导入 TEST数据库中。

    imp system/manager@TEST  file=d:\daochu.dmp

    上面可能有点问题，因为有的表已经存在，然后它就报错，对该表就不进行导入。

    在后面加上 ignore=y 就可以了。

  2 将d:\daochu.dmp中的表table1 导入

  imp system/manager@TEST  file=d:\daochu.dmp  tables=(table1) 


----------------- 
1、如果是将A机器安装好数据库，再移植到未安装数据库的B机器上，除了克隆没有别的办法。
2、如果A、B两台机器都安装了数据库，然后再把A数据库移植到B，可采用EXP/IMP解决。
导出：EXP DBA用户/口令@服务名 file=文件名 direct=y full=y compress=y
导入：IMP DBA用户/口令@服务名 file=文件名 full=y


----------------------
最后使用的：
在linux下导出：   exp system/oracle@TEST file=oracle/daochu.dmp owner=user1，user2
在linux下导入：   首先创建用户
然后 IMP DBA用户/口令@服务名 file=文件名 full=y