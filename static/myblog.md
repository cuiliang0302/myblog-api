---
title: myblog v1.0.0
language_tabs:
  - shell: Shell
  - http: HTTP
  - javascript: JavaScript
  - ruby: Ruby
  - python: Python
  - php: PHP
  - java: Java
  - go: Go
toc_footers: []
includes: []
search: true
code_clipboard: true
highlight_theme: darkula
headingLevel: 2
generator: "@tarslib/widdershins v4.0.5"

---

# myblog

> v1.0.0

# 网站管理/轮播图管理

## GET 获取轮播图

GET /management/carousel/

> 返回示例

> 成功

```json
[
  {
    "id": 6,
    "img": "https://oss.cuiliangblog.cn/carousel/%E7%BD%91%E7%AB%99%E6%9B%B4%E6%96%B0%E5%85%AC%E5%91%8A.png",
    "url": "https://www.cuiliangblog.cn/",
    "title": "网站更新公告",
    "is_show": true
  },
  {
    "id": 4,
    "img": "https://oss.cuiliangblog.cn/carousel/qiniu.png",
    "url": "https://s.qiniu.com/vMVVzq",
    "title": "七牛云",
    "is_show": true
  },
  {
    "id": 3,
    "img": "https://oss.cuiliangblog.cn/carousel/aliyun.png",
    "url": "https://www.aliyun.com/daily-act/ecs/fy22-12-yure?userCode=gs1gd34d",
    "title": "阿里云",
    "is_show": true
  },
  {
    "id": 2,
    "img": "https://oss.cuiliangblog.cn/carousel/carousel-1.png",
    "url": "https://www.yuque.com/login?platform=wechat&inviteToken=d250cce7a9bfb322880f20b1d1c4cdc482efb9966f48a20bc6fbb66407542ced",
    "title": "语雀",
    "is_show": true
  },
  {
    "id": 1,
    "img": "https://oss.cuiliangblog.cn/carousel/tengxun.png",
    "url": "https://cloud.tencent.com/act/cps/redirect?redirect=1077&cps_key=1dc036d339a0a2edb541d6386197a81b&from=console",
    "title": "腾讯云推广",
    "is_show": true
  }
]
```

```json
[
  {
    "id": 6,
    "img": "https://oss.cuiliangblog.cn/carousel/%E7%BD%91%E7%AB%99%E6%9B%B4%E6%96%B0%E5%85%AC%E5%91%8A.png",
    "url": "https://www.cuiliangblog.cn/",
    "title": "网站更新公告",
    "is_show": true
  },
  {
    "id": 4,
    "img": "https://oss.cuiliangblog.cn/carousel/qiniu.png",
    "url": "https://s.qiniu.com/vMVVzq",
    "title": "七牛云",
    "is_show": true
  },
  {
    "id": 3,
    "img": "https://oss.cuiliangblog.cn/carousel/aliyun.png",
    "url": "https://www.aliyun.com/daily-act/ecs/fy22-12-yure?userCode=gs1gd34d",
    "title": "阿里云",
    "is_show": true
  },
  {
    "id": 2,
    "img": "https://oss.cuiliangblog.cn/carousel/carousel-1.png",
    "url": "https://www.yuque.com/login?platform=wechat&inviteToken=d250cce7a9bfb322880f20b1d1c4cdc482efb9966f48a20bc6fbb66407542ced",
    "title": "语雀",
    "is_show": true
  },
  {
    "id": 1,
    "img": "https://oss.cuiliangblog.cn/carousel/tengxun.png",
    "url": "https://cloud.tencent.com/act/cps/redirect?redirect=1077&cps_key=1dc036d339a0a2edb541d6386197a81b&from=console",
    "title": "腾讯云推广",
    "is_show": true
  }
]
```

```json
[
  {
    "id": 6,
    "img": "https://oss.cuiliangblog.cn/carousel/%E7%BD%91%E7%AB%99%E6%9B%B4%E6%96%B0%E5%85%AC%E5%91%8A.png",
    "url": "https://www.cuiliangblog.cn/",
    "title": "网站更新公告",
    "is_show": true
  },
  {
    "id": 4,
    "img": "https://oss.cuiliangblog.cn/carousel/qiniu.png",
    "url": "https://s.qiniu.com/vMVVzq",
    "title": "七牛云",
    "is_show": true
  },
  {
    "id": 3,
    "img": "https://oss.cuiliangblog.cn/carousel/aliyun.png",
    "url": "https://www.aliyun.com/daily-act/ecs/fy22-12-yure?userCode=gs1gd34d",
    "title": "阿里云",
    "is_show": true
  },
  {
    "id": 2,
    "img": "https://oss.cuiliangblog.cn/carousel/carousel-1.png",
    "url": "https://www.yuque.com/login?platform=wechat&inviteToken=d250cce7a9bfb322880f20b1d1c4cdc482efb9966f48a20bc6fbb66407542ced",
    "title": "语雀",
    "is_show": true
  },
  {
    "id": 1,
    "img": "https://oss.cuiliangblog.cn/carousel/tengxun.png",
    "url": "https://cloud.tencent.com/act/cps/redirect?redirect=1077&cps_key=1dc036d339a0a2edb541d6386197a81b&from=console",
    "title": "腾讯云推广",
    "is_show": true
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 网站管理/关于页

## GET 获取关于页列表

GET /management/about/

> 返回示例

> 成功

```json
[
  {
    "id": 1,
    "title": "关于博主",
    "body": "Hi 陌生人，欢迎访问我的博客网站！\r\n\r\n先做个简单的自我介绍。我叫崔亮，老家在甘肃，18年开始北漂。目前在IBM从事运维开发相关工作，日常工作主要就是centos、kubernetes、prometheus、grafana、elk的相关运维工作。\r\n\r\n作为一名专业的运维从业者。我精通水晶头的制作和服务器开关机重启，擅长centos系统管理、Web服务部署维护，熟悉Ansible批量运维工具和CI/CD相关使用，以及MySQL的基本操作，略懂Kubernets和docker容器管理，以及监控日志方面的prometheus、elk和grafana使用。\r\n\r\n编程开发方面，除了日常必备的shell脚本外，也经常使用Python开发一些小工具程序。比较常用web相关的Django、DRF、Flask库开发项目，偶尔也使用requests、 pandas库以及调用开源组件的API、SDK开发点小工具，提高运维效率。前端主要使用Vue开发项目。\r\n\r\n平时除了喜欢钻研技术外，空闲时间偶尔也爱看看电影、玩玩游戏。",
    "time": "2022-05-16T17:00:56.485021+08:00"
  },
  {
    "id": 2,
    "title": "关于网站",
    "body": "## 建站目的\r\n\r\n作为一名运维工程师，知识的积累是必不可少的，本人在工作和学习中记录了大量的笔记，打算通过这个博客平台，分享工作中遇到的各种问题的解决办法和学习笔记总结，本站所有文章和笔记内容都是本人亲自实践过后总结所得，各种坑已经替大家踩过了，大家可以放心参考。\r\n\r\n本站所有文章均为原创，若有引用会在博文底部均注明了参考地址，如有遗漏，欢迎您联系我进行处理。因原创文章均由自己手打而成，即使发表时检查再三也难免有错误或者错别字产生，如果您发现了需要更正的地方或者您有更好的见解和思路，欢迎评论留言。\r\n\r\n开发博客网站一方面也是为了督促自己每天学习，发表文章和笔记内容。另一方面，希望能通过这个网站结识更多志趣相同的人，一起交流研究运维技术，提高个人专业能力。\r\n\r\n\r\n## 网站技术\r\n\r\n目前的博客网站大多才有HEXO或者WordPress搭建而成，拿来即用。但博客网站这件事，我还是喜欢自己造轮子。可以随心所欲地按需开发功能模块，设计业务逻辑，制作前端样式。同时也是通过博客网站项目将业务产品从需求分析、功能模块设计、数据库设计、代码开发、项目测试、部署运维、SEO优化的整个流程做一个充分了解，提高自己的运维开发能力。\r\n\r\n网站前端使用VUE3.2框架，JavaScript开发语言，Vite构建工具完成开发。其中PC端使用element-plus，手机端使用vant，admin端也是element-plus，以及echaets实现数据可视化。\r\n\r\n网站后端使用Django REST framework。遵循RESTful API接口规范开发，为VUE前端提供API数据接口。\r\n\r\n由NGINX服务器根据用户不同的UA，反向代理至PC端或者手机端vue项目提供访问，手机端和PC端共用一套后端API接口，手机端访问地址[https://m.cuiliangblog.cn](https://m.cuiliangblog.cn \"https://m.cuiliangblog.cn\")，电脑端访问地址[https://www.cuiliangblog.cn](https://www.cuiliangblog.cn \"https://www.cuiliangblog.cn\")。\r\n\r\n富文本编辑器使用markdown。\r\n\r\n数据库使用MySQL，以及Redis缓存加速。\r\n\r\n网站部署在阿里云服务器，使用docker-compose部署。css、js、字体、图片等静态资源以及用户上传数据使用七牛OSS对象存储。前端VUE使用腾讯CDN提供加速服务。\r\n\r\n站点流量通过调用百度统计的api接口实现流量统计分析。\r\n\r\n整个项目遵循敏捷开发思路，使用腾讯coding实现项目自动打包构建与部署，以及CDN自动刷新等操作。\r\n\r\n## 网站架构\r\n\r\n![](https://oss.cuiliangblog.cn/markdown/%E5%8D%9A%E5%AE%A2%E7%BD%91%E7%AB%99%E6%9E%B6%E6%9E%841.png)\r\n\r\n## 功能模块\r\n\r\n博客网站按照用户身份权限共划分为游客访问前台、用户管理后台、管理员后台三部分，总共二十八个功能模块。\r\n\r\n除了具备博客网站基本的文章浏览查看评论功能外，还贴心的增加了主题换肤、深色模式适配、字体大小调整、第三方登录、邮件订阅等特色功能。\r\n\r\n### 游客用户前台\r\n\r\n不需要直接登录的页面均属于游客用户前台，包含网站首页、文章列表、笔记列表、标签列表、文章浏览、笔记浏览、归档、留言板、关于页等功能模块。\r\n\r\n### 电脑端用户管理后台\r\n\r\n用户登录或注册后，可以进行发表文章评论、收藏文章、发表留言以及回复留言评论操作，在个人中心可以查看自己的浏览记录，收藏记录，点赞记录，还可以修改个人信息、修改密码、修改邮箱等功能。\r\n\r\n- 个人中心\r\n![](https://oss.cuiliangblog.cn/markdown%2Fpc-user-1.png)\r\n\r\n- 个人中心（深色模式）\r\n![](https://oss.cuiliangblog.cn/markdown%2Fpc-user-2.png)\r\n\r\n- 修改信息\r\n![](https://oss.cuiliangblog.cn/markdown%2Fpc-user-3.png)\r\n\r\n- 浏览记录\r\n![](https://oss.cuiliangblog.cn/markdown%2Fpc-user-4.png)\r\n\r\n### 手机端用户管理后端\r\n\r\n- 个人中心\r\n![](https://oss.cuiliangblog.cn/markdown%2Fm-user-5.jpg)\r\n\r\n- 数据统计\r\n![](https://oss.cuiliangblog.cn/markdown%2Fm-user-3.jpg)\r\n\r\n- 修改信息\r\n![](https://oss.cuiliangblog.cn/markdown%2Fm-user-2.jpg)\r\n\r\n- 浏览记录\r\n![](https://oss.cuiliangblog.cn/markdown%2Fm-user-4.jpg)\r\n\r\n- 字体设置\r\n![](https://oss.cuiliangblog.cn/markdown%2Fm-user-1.jpg)\r\n\r\n### admin端管理员后台\r\n\r\n后台博客管理系统是为管理员管理博客而设置的，管理员可以查看网站流量数据，查看注册用户信息，可以对文章进行发布、修改、删除操作。以及对文章分类，标签管理。还有设置博客网站的轮播图、友情链接等内容。\r\n\r\n![](https://oss.cuiliangblog.cn/markdown/2020_12_26_23_52_32_791830.jpg)\r\n\r\n![](https://oss.cuiliangblog.cn/markdown/2020_12_09_12_21_06_545641.png)\r\n\r\n![](https://oss.cuiliangblog.cn/markdown/2020_12_09_12_21_55_166338.png)\r\n\r\n![](https://oss.cuiliangblog.cn/markdown/2020_12_09_12_22_36_497601.png)\r\n\r\n![](https://oss.cuiliangblog.cn/markdown/2020_12_09_12_22_59_876194.png)\r\n\r\n![](https://oss.cuiliangblog.cn/markdown/2020_12_09_12_23_22_812681.png)\r\n\r\n正如冰山一般，你看到的仅是一小部分模块，网站后台页面同样精彩，也欢迎大家通过邮箱注册账号，登录体验完整功能！\r\n\r\n## 建站历程\r\n\r\n|  时间 | 事件  | 版本 |\r\n| ------------ | ------------ |-----------|\r\n|  2019.6.10 | 作为毕业设计作品，历时两个月完成开发。前端使用Bootstrap，实现了博客的基本功能  |v1|\r\n| 2020.5.11| 新版本开发完成，使用layui对前端页面进行美化，并使用layui-mini重构了用户个人中心模块，新增了系统管理模块。现已开源，欢迎大家访问。[gitee地址](https://gitee.com/cuiliang0302/myblog \"gitee地址\")  [github地址](https://github.com/cuiliang0302/myblog \"github地址\") |v2|\r\n|2021.3.22|使用vue+DRF重构项目，采用前后端分离模式。为更好优化手机端体验，单独开发PC端和手机端。目前项目正在开发中|v3",
    "time": "2022-05-16T18:07:10.818456+08:00"
  },
  {
    "id": 3,
    "title": "关于友链",
    "body": "### 申请地址：\r\n\r\n[https://www.cuiliangblog.cn/applyLink](https://www.cuiliangblog.cn/applyLink \"https://www.cuiliangblog.cn/applyLink\")\r\n\r\n\r\n### 申请格式：\r\n\r\n- 网站名称：崔亮的博客\r\n\r\n- 网站地址：https://www.cuiliangblog.cn\r\n\r\n- 网站简介：专注devops自动化运维，传播优秀it运维技术文章\r\n\r\n- 网站logo尺寸：https://oss.cuiliangblog.cn/image/logo.png",
    "time": "2021-12-10T22:16:12.033273+08:00"
  },
  {
    "id": 4,
    "title": "关于赞赏",
    "body": "### 赞赏说明\r\n由于网站每个月都需要大量的费用维护，且目前没有有效的盈利方式\r\n\r\n如果您感觉本站对您有帮助，欢迎扫取下面的二维码赞助一顿饭钱，让博主不再忍受饥饿~\r\n\r\n但是如果您感觉本站对您没有任何帮助，那么一分钱也不要赞助，让博主继续饿着吧！(๑•̀ㅂ•́)و✧\r\n\r\n（请赞助后发送邮件或添加本人QQ/微信联系，如果未联系，则默认为匿名赞助。）\r\n### 赞赏地址\r\n![](https://oss.cuiliangblog.cn/markdown/2020_10_28_12_05_13_529384.png)\r\n### 已赞赏列表\r\n赞助名单\r\n(按照赞助时间先后排名，以*开头的名单均为匿名赞助）：\r\n\r\n| 赞助者 |平台 |金额   |时间   |\r\n| :------------: | :------------: | :------------: | :------------: |\r\n| * |  支付宝 |5 |  2020.11.04 |\r\n|  寡人为王 |  微信|10 |  2020.11.08 |\r\n| *音|微信|  20 |  2020.11.11 |\r\n|  Marina | 微信| 3 |  2020.11.18 |\r\n|  *思亲 | 支付宝| 8 |  2020.11.19 |\r\n|  董小姐| 微信| 1 |  2020.11.19 |\r\n| 天空大海| 微信 | 88 | 2020.12.14|\r\n| 诗人的眼里| 微信 | 88 | 2021.2.5|\r\n| 天听| 微信 |30 |2021.2.8|\r\n| *宇| 微信 |5 |2021.2.23|\r\n|*玲|支付宝|300|2021.3.23|\r\n|*凯|支付宝|25|2021.3.24|\r\n|*才|支付宝|20|2021.3.28|\r\n|时光鸡|微信|6|2021.5.22|\r\n|*。|微信|1|2021.5.22|\r\n|*流|微信|20|2021.7.14|\r\n|时光鸡|微信|30|2021.8.21|\r\n|TOM|微信|66|2021.8.21|\r\n|小马哥|微信|500|2022.2.23|\r\n\r\n感谢以上所有人对本站的支持，我会更加努力让本站帮助到更多的人，谢谢！",
    "time": "2022-02-25T10:29:40.927072+08:00"
  },
  {
    "id": 5,
    "title": "特别鸣谢",
    "body": "> 项目的开发离不开这些优秀的开源组件与框架。正是有了这些轮子，才使得开发过程更加的顺利。在此万分感谢大佬们贡献的开源项目。\r\n\r\n### CSS组件\r\n\r\n|  组件 | 简介 |地址|\r\n| ------------ | ------------ | ----------- |\r\n|animate.css | css动画库  | https://github.com/animate-css/animate.css |\r\n|normalize.css |css初始化| https://github.com/necolas/normalize.css|\r\n|loaders.css|css加载动画|https://github.com/ConnorAtherton/loaders.css|\r\n\r\n### JS组件\r\n\r\n|  组件 | 简介 |地址|\r\n| ------------ | ------------ | ----------- |\r\n|ECharts|js可视化图表库|https://github.com/apache/echarts|\r\n|Fuse.js|js模糊匹配搜索|https://fusejs.io|\r\n|Day.js|js处理日期时间|https://dayjs.fenxianglu.cn|\r\n|Lodash.js|js实用工具库|https://www.lodashjs.com|\r\n\r\n### VUE组件\r\n|  组件 | 简介 |地址|\r\n| ------------ | ------------ | ----------- |\r\n| vant  | 有赞vue组件库  | https://github.com/youzan/vant |\r\n| element-plus| 饿了么element组件库| https://github.com/element-plus/element-plus|\r\n|  vue-echarts |vue封装百度echarts| https://github.com/ecomfe/vue-echarts  |\r\n|vue-markdown-editor|markdown富文本编辑器| https://github.com/code-farmer-i/vue-markdown-editor |\r\n|vue3-cropper|头像图片裁剪(手机端)|https://github.com/dreamicalwestswim/vue3-cropper|\r\n|vue-cropper|头像图片裁剪(PC端)|https://github.com/xyxiao001/vue-cropper|\r\n|vue-drag-verify|滑块验证、图片验证|https://github.com/yimijianfang/vue-drag-verify|\r\n|vuex-along | vuex数据持久化|https://github.com/boenfu/vuex-along|\r\n|vue-clipboard3|剪切板调用操作|https://github.com/JamieCurnow/vue-clipboard3|\r\n|wangEditor |轻量级web富文本框| https://github.com/wangeditor-team/wangEditor |\r\n\r\n### Django组件\r\n|  组件 | 简介 |地址|\r\n| ------------ | ------------ | ----------- |\r\n|loguru|python日志记录|https://github.com/Delgan/loguru|\r\n|qiniu-python-sdk |七牛OSS存储sdk| https://github.com/qiniu/python-sdk|\r\n|simpleui |Django admin样式美化|https://gitee.com/tompeppa/simpleui|\r\n|django-redis | Django使用redis  | https://github.com/jazzband/django-redis |\r\n|django-apscheduler|Django定时任务|https://github.com/agronholm/apscheduler|\r\n|django-cors-headers|Django跨域|https://github.com/adamchainz/django-cors-headers|\r\n|django-filter|Django过滤|https://github.com/carltongibson/django-filter|\r\n|django-mdeditor|Django markdown富文本|https://github.com/pylixm/django-mdeditor|\r\n|drf-extensions|DRF 数据缓存|https://github.com/chibisov/drf-extensions|\r\n|djangorestframework-recursive|DRF 自关联递归序列化器|https://github.com/heywbj/django-rest-framework-recursive|\r\n|djangorestframework-simplejwt|DRF jwt认证|https://github.com/jazzband/djangorestframework-simplejwt|",
    "time": "2021-12-14T10:32:29.580351+08:00"
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 网站管理/友情链接

## GET 获取友情链接

GET /management/link/

> 返回示例

> 成功

```json
[
  {
    "id": 1,
    "type_name": "强烈推荐",
    "name": "VUE",
    "logo": "https://oss.cuiliangblog.cn/logo/Vue.png",
    "url": "https://v3.vuejs.org/",
    "describe": "渐进式 JavaScript 框架",
    "type": "2",
    "is_activate": true
  },
  {
    "id": 2,
    "type_name": "强烈推荐",
    "name": "Django",
    "logo": "https://oss.cuiliangblog.cn/logo/django.png",
    "url": "https://www.djangoproject.com/",
    "describe": "python开源web开发框架",
    "type": "2",
    "is_activate": true
  },
  {
    "id": 3,
    "type_name": "强烈推荐",
    "name": "Django REST Framework",
    "logo": "https://oss.cuiliangblog.cn/logo/DRF.png",
    "url": "https://www.django-rest-framework.org/",
    "describe": "遵循REST API规范的Django App开发框架",
    "type": "2",
    "is_activate": true
  },
  {
    "id": 4,
    "type_name": "强烈推荐",
    "name": "vant",
    "logo": "https://oss.cuiliangblog.cn/logo/vant.png",
    "url": "https://vant-contrib.gitee.io/vant/v3/#/zh-CN",
    "describe": "轻量、可靠的移动端 Vue 组件库",
    "type": "2",
    "is_activate": true
  },
  {
    "id": 5,
    "type_name": "友情链接",
    "name": "Alliot's blog",
    "logo": "https://cdn.cuiliangblog.cn/media/link/2021_03_22_13_06_56_774347.jpg",
    "url": "https://www.iots.vip/",
    "describe": "Maker & Developer",
    "type": "1",
    "is_activate": true
  },
  {
    "id": 9,
    "type_name": "友情链接",
    "name": "StarsL's Blog",
    "logo": "https://oss.cuiliangblog.cn/logo/2021_6_21_16_41_43-1624264903908.jpg",
    "url": "https://starsl.cn",
    "describe": "StarsL's Blog",
    "type": "1",
    "is_activate": true
  },
  {
    "id": 10,
    "type_name": "友情链接",
    "name": "糊涂博客",
    "logo": "https://oss.cuiliangblog.cn/logo/2021_7_22_19_52_38-1626954758330.jpg",
    "url": "https://www.lpya.cn/",
    "describe": "每天进步一点点",
    "type": "1",
    "is_activate": true
  },
  {
    "id": 13,
    "type_name": "友情链接",
    "name": "Alexcld colwn fish",
    "logo": "https://oss.cuiliangblog.cn/logo/2022_01_13_08_40_34_355-1642034434413.jpg",
    "url": "https://blogtest.alexcld.com",
    "describe": "专注devops自动化运维，传播累计运维技术文章",
    "type": "1",
    "is_activate": true
  },
  {
    "id": 16,
    "type_name": "强烈推荐",
    "name": "vite",
    "logo": "https://oss.cuiliangblog.cn/link/2022_03_22_15_01_35_565-1647932495669.jpg",
    "url": "https://cn.vitejs.dev/",
    "describe": "下一代前端开发与构建工具",
    "type": "2",
    "is_activate": true
  },
  {
    "id": 17,
    "type_name": "强烈推荐",
    "name": "element-plus",
    "logo": "https://oss.cuiliangblog.cn/link/2022_03_22_15_04_36_593-1647932676782.jpg",
    "url": "https://element-plus.gitee.io/zh-CN/",
    "describe": "基于 Vue 3，面向设计师和开发者的组件库",
    "type": "2",
    "is_activate": true
  },
  {
    "id": 18,
    "type_name": "强烈推荐",
    "name": "echarts",
    "logo": "https://oss.cuiliangblog.cn/link/2022_03_22_15_06_55_470-1647932815570.jpg",
    "url": "https://echarts.apache.org/zh/index.html",
    "describe": "一个基于 JavaScript 的开源可视化图表库",
    "type": "2",
    "is_activate": true
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## POST 申请友情链接

POST /management/link/

> Body 请求参数

```yaml
name: 百度
logo: https://cdn.cuiliangblog.cn/media/photo/default.jpg
url: https://www.baidu.com/
describe: 百度一下，你就知道

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» name|body|string| 是 |网站名称|
|» logo|body|string| 是 |网站logo|
|» url|body|string| 是 |网址|
|» describe|body|string| 是 |网站简介|

> 返回示例

> 成功

```json
{
  "id": 27,
  "type_name": "友情链接",
  "name": "百度",
  "logo": "https://cdn.cuiliangblog.cn/media/photo/default.jpg",
  "url": "https://www.baidu.com/",
  "describe": "百度一下，你就知道",
  "type": "1",
  "is_activate": false
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 网站管理/博主信息

## GET 获取博主信息

GET /management/info/1/

> 返回示例

> 成功

```json
{
  "id": 1,
  "position": "运维开发工程师",
  "company": "IBM",
  "location": "北京",
  "email": "cuiliang0302@qq.com",
  "github": "https://github.com/cuiliang0302",
  "gitee": "https://gitee.com/cuiliang0302",
  "qq": "1554382111",
  "qq_img": "https://oss.cuiliangblog.cn/image/qq.png",
  "wechat": "cuiliang0302",
  "wechat_img": "https://oss.cuiliangblog.cn/image/weixin.png",
  "wechat_pay": "https://oss.cuiliangblog.cn/image/weixin-pay1.png",
  "ali_pay": "https://oss.cuiliangblog.cn/image/ali-pay.png"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 网站管理/网站配置

## GET 获取网站配置

GET /management/siteConfig/1/

> 返回示例

> 成功

```json
{
  "id": 1,
  "logo": "https://oss.cuiliangblog.cn/image/logo.png",
  "icon": "https://oss.cuiliangblog.cn/image/favicon.ico",
  "name": "崔亮的博客",
  "domain": "https://www.cuiliangblog.cn",
  "title": "崔亮的博客-专注devops自动化运维，传播优秀it运维技术文章",
  "keywords": "运维开发,自动化运维,k8s,docker,vue,python,prometheus,devops,linux,云计算,虚拟化",
  "describe": "崔亮的个人博客，致力于分享运维开发等技术经验，由系统运维、脚本编程、devops等分类组成，涵盖了docker、k8s、vue、python、DevOps、linux、prometheus、自动化运维、云计算、虚拟化等内容。",
  "copyright": "Copyright © 2019-2021 崔亮的博客 All Rights Reserved",
  "icp_num": "陇ICP备19001718号",
  "icp_url": "https://beian.miit.gov.cn/#/Integrated/index",
  "police_num": "京公安备11011202002337号",
  "police_url": "http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11011202002337",
  "photo": "https://oss.cuiliangblog.cn/images/photo.jpg",
  "cover": "https://oss.cuiliangblog.cn/image/cover.jpg"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 网站管理/管理页数据统计

## GET 网站数据与前日对比统计

GET /management/siteCount/

> 返回示例

> 成功

```json
{
  "today_pv": 22,
  "today_uv": 6,
  "today_time": 85,
  "today_page": 3.67,
  "today_new_user": 4,
  "compare_pv": 340,
  "compare_uv": 200,
  "compare_time": -57.5,
  "compare_page": 46.8,
  "compare_new_user": 100
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 服务器信息统计

GET /management/serverCount/

> 返回示例

> 成功

```json
{
  "cpu_rate": 7.8,
  "memory_rate": 85,
  "disk_rate": 83,
  "load_15": 1
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 网站数据总量统计

GET /management/siteStatistics/

> 返回示例

> 成功

```json
{
  "uptime": 519,
  "pv": 91346,
  "uv": 20549,
  "ip": 17474,
  "article": 43,
  "section": 205,
  "category": 10,
  "note": 3,
  "tag": 8
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 网站管理/管理页数据统计/获取网站统计echarts数据

## GET 网站统计echarts接口-访客设备

GET /management/siteEcharts/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|chart|query|string| 是 |none|

> 返回示例

> 成功

```json
[
  {
    "name": "PC端",
    "value": 435
  },
  {
    "name": "移动端",
    "value": 263
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 内容管理/博客文章

## GET 文章列表（推荐阅读）

GET /blog/article/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|ordering|query|string| 否 |推荐阅读排序|
|page|query|string| 否 |页数|
|size|query|string| 否 |每页数|

> 返回示例

> 成功

```json
{
  "count": 43,
  "next": "https://api.cuiliangblog.cn/v1/blog/article/?ordering=-is_recommend%2C-created_time&page=2&size=5",
  "previous": null,
  "results": [
    {
      "id": 41,
      "category": "Python",
      "category_id": 3,
      "title": "celery定时与异步任务详解",
      "abstract": "Celery是一个简单、灵活且可靠的，处理大量消息的分布式系统，专注于实时处理的异步任务队列，同时也支持任务调度。如何在Python和django项目中使用celery实现定时任务和异步任务呢？本篇文章带你深入学习和使用celery。",
      "cover": "https://oss.cuiliangblog.cn/articleCover/2022_03_15_10_08_07_079-1647310087150.jpg",
      "view": 298,
      "like": 7,
      "collect": 0,
      "comment": 0,
      "created_time": "2022-03-15T10:08:25.425371+08:00",
      "modified_time": "2022-05-19T17:29:06.048012+08:00",
      "is_recommend": true,
      "is_release": true,
      "author": 1,
      "tags": [
        6,
        9
      ]
    },
    {
      "id": 40,
      "category": "Django",
      "category_id": 4,
      "title": "Django SimpleUI与vue的完美结合",
      "abstract": "django 与django simple ui的黄金组合，可以在短时间内快速开发出一套完整的admin后台管理页。但是现在越来越多的项目都开始使用前后端分离开发，如何将vue项目与django admin完美结合，根据需求实现首页以及其他页面的自定义开发？本文带你一探究竟。",
      "cover": "https://oss.cuiliangblog.cn/articleCover/Django%20SimpleUI%E4%B8%8Evue%E7%9A%84%E5%AE%8C%E7%BE%8E%E7%BB%93%E5%90%88.png",
      "view": 448,
      "like": 2,
      "collect": 0,
      "comment": 0,
      "created_time": "2022-03-03T09:17:35.322020+08:00",
      "modified_time": "2022-05-22T16:49:21.118142+08:00",
      "is_recommend": true,
      "is_release": true,
      "author": 1,
      "tags": [
        8,
        9
      ]
    },
    {
      "id": 39,
      "category": "其他",
      "category_id": 8,
      "title": "浅谈运维工程师的开发能力的培养",
      "abstract": "总结了本人这两年多的运维岗位职业发展路线、需要掌握的技能点、以及在工作中碰到的自动化运维案例分享，还有对于运维的思考。",
      "cover": "https://oss.cuiliangblog.cn/articleCover/%E6%B5%85%E8%B0%88%E8%BF%90%E7%BB%B4%E5%B7%A5%E7%A8%8B%E5%B8%88%E7%9A%84%E5%BC%80%E5%8F%91%E8%83%BD%E5%8A%9B%E7%9A%84%E5%9F%B9%E5%85%BB.png",
      "view": 623,
      "like": 10,
      "collect": 0,
      "comment": 0,
      "created_time": "2022-02-22T08:54:52.241462+08:00",
      "modified_time": "2022-05-22T10:33:34.146384+08:00",
      "is_recommend": true,
      "is_release": true,
      "author": 1,
      "tags": [
        1,
        9
      ]
    },
    {
      "id": 37,
      "category": "Django",
      "category_id": 4,
      "title": "前后端分离项目OAuth登录总结",
      "abstract": "最近在开发博客网站登录过程中，涉及到了多个前端对应一个后端的前后端分离项目如何使用OAuth完成第三方授权登录的问题，特此总结一篇文章，详细记录了完整的开发过程思路分析和具体的代码实现，大家需要相同的业务场景时可参考使用。",
      "cover": "https://oss.cuiliangblog.cn/articleCover/%E5%89%8D%E5%90%8E%E7%AB%AF%E5%88%86%E7%A6%BB%E9%A1%B9%E7%9B%AEOAuth%E7%99%BB%E5%BD%95%E6%80%BB%E7%BB%93.png",
      "view": 404,
      "like": 3,
      "collect": 0,
      "comment": 0,
      "created_time": "2022-01-05T09:10:38.501427+08:00",
      "modified_time": "2022-05-20T22:56:50.560507+08:00",
      "is_recommend": true,
      "is_release": true,
      "author": 1,
      "tags": [
        8,
        9
      ]
    },
    {
      "id": 36,
      "category": "前端",
      "category_id": 9,
      "title": "详解用户图片上传流程",
      "abstract": "最近在开发新版博客网站时，有几个页面需要使用图片上传功能。整个项目前端基于vue3的element-plue和vue-cropper组件库封装一个图片上传组件，后端使Django REST framework开发api接口，存储使用七牛对象存储，以及腾讯CDN加速，总结了完整的前后端代码以及运维配置，以供大家参考。",
      "cover": "https://oss.cuiliangblog.cn/articleCover/%E8%AF%A6%E8%A7%A3%E7%94%A8%E6%88%B7%E5%9B%BE%E7%89%87%E4%B8%8A%E4%BC%A0%E6%B5%81%E7%A8%8B.png",
      "view": 369,
      "like": 2,
      "collect": 0,
      "comment": 0,
      "created_time": "2021-12-17T08:50:41.007657+08:00",
      "modified_time": "2022-05-22T15:50:44.290980+08:00",
      "is_recommend": true,
      "is_release": true,
      "author": 1,
      "tags": [
        8,
        9
      ]
    }
  ]
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 获取博客文章详情

GET /blog/article/{id}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|

> 返回示例

> 成功

```json
{
  "id": 18,
  "category": "前端",
  "category_id": 9,
  "tags": [
    {
      "id": 8,
      "name": "编程开发"
    },
    {
      "id": 9,
      "name": "经验总结"
    }
  ],
  "title": "VUE3添加animate页面切换动画",
  "abstract": "众所周知，animate作为一款优秀的开源CSS动画库，具有使用简单、兼容性强、动画丰富的特点。那么如何在自己的项目中使用炫酷的animate动画，实现页面切换特效呢？本文带你快速上手使用animate动画。",
  "cover": "https://oss.cuiliangblog.cn/articleCover/2021_05_06_11_55_23_331167.jpg",
  "body": "> 众所周知，animate作为一款优秀的开源CSS动画库，具有使用简单、兼容性强、动画丰富的特点。那么如何在自己的项目中使用炫酷的animate动画，实现页面切换特效呢？本文带你快速上手使用animate动画。\r\n\r\n## 一、创建项目与页面\r\n\r\n> 初始化项目后默认有home页面和about页面。为了演示添加不同的动画效果，我们再添加test1和test2页面，并将各个页面使用router-link互相链接跳转。\r\n\r\n### 1. Home.vue\r\n\r\n```vue\r\n<template>\r\n  <div class=\"home\">\r\n    <router-link to=\"/about\">跳转About</router-link>\r\n    <br>\r\n    <router-link to=\"/test1\">跳转Test</router-link>\r\n    <br>\r\n    <router-link to=\"/test2\">跳转Test2</router-link>\r\n    <h1>这是主页</h1>\r\n  </div>\r\n</template>\r\n\r\n<script>\r\nexport default {\r\n  name: 'Home',\r\n}\r\n</script>\r\n<style lang=\"scss\">\r\n.home{\r\n  background-color: skyblue;\r\n  height: 100vh;\r\n}\r\n</style>\r\n```\r\n\r\n### 2. About.vue\r\n\r\n```vue\r\n<template>\r\n  <div class=\"about\">\r\n    <router-link to=\"/home\">跳转Home</router-link>\r\n    <br>\r\n    <router-link to=\"/test1\">跳转Test1</router-link>\r\n    <br>\r\n    <router-link to=\"/test2\">跳转Test2</router-link>\r\n    <h1>这是关于页</h1>\r\n  </div>\r\n</template>\r\n\r\n<script>\r\nexport default {\r\n  name: 'About',\r\n}\r\n</script>\r\n<style lang=\"scss\">\r\n.about{\r\n  background-color: pink;\r\n  height: 100vh;\r\n}\r\n</style>\r\n```\r\n\r\n### 3. Test1.vue\r\n\r\n```vue\r\n<template>\r\n  <div class=\"test1\">\r\n    <router-link to=\"/about\">跳转About</router-link>\r\n    <br>\r\n    <router-link to=\"/home\">跳转Home</router-link>\r\n    <br>\r\n    <router-link to=\"/test2\">跳转Test2</router-link>\r\n    <h1>这是测试页</h1>\r\n  </div>\r\n</template>\r\n\r\n<script>\r\nexport default {\r\n  name: 'Test',\r\n}\r\n</script>\r\n<style lang=\"scss\">\r\n.test1{\r\n  background-color: darkcyan;\r\n  height: 100vh;\r\n}\r\n</style>\r\n```\r\n\r\n### 4. Test2.vue\r\n\r\n```vue\r\n<template>\r\n  <div class=\"test2\">\r\n    <router-link to=\"/about\">跳转About</router-link>\r\n    <br>\r\n    <router-link to=\"/home\">跳转Home</router-link>\r\n    <br>\r\n    <router-link to=\"/test1\">跳转Test1</router-link>\r\n    <h1>这是测试页</h1>\r\n  </div>\r\n</template>\r\n\r\n<script>\r\nexport default {\r\n  name: 'Test',\r\n}\r\n</script>\r\n<style lang=\"scss\">\r\n.test2 {\r\n  background-color: gold;\r\n  height: 100vh;\r\n}\r\n</style>\r\n```\r\n\r\n### 5. router\r\n\r\n```javascript\r\nimport { createRouter, createWebHistory } from 'vue-router'\r\n\r\nconst routes = [\r\n  {\r\n    path: '/home',\r\n    name: 'Home',\r\n    component: () => import('@/views/Home')\r\n  },\r\n  {\r\n    path: '/about',\r\n    name: 'About',\r\n    component: () => import('@/views/About')\r\n  },\r\n  {\r\n    path: '/test1',\r\n    name: 'Test1',\r\n    component: () => import('@/views/Test1')\r\n  },\r\n  {\r\n    path: '/test2',\r\n    name: 'Test2',\r\n    component: () => import('@/views/Test2')\r\n  },\r\n]\r\n\r\nconst router = createRouter({\r\n  history: createWebHistory(process.env.BASE_URL),\r\n  routes\r\n})\r\n\r\nexport default router\r\n```\r\n\r\n## 二、添加动画配置\r\n\r\n### 1. 安装animate.css\r\n\r\n```bash\r\nnpm install animate.css -D\r\n```\r\n\r\n### 2. 修改router，添加动画元信息名称\r\n\r\n> 首先修改router下的index.js，添加meat标签，并定义不同的动画类型，达到自定义不同页面添加不同的动画效果。\r\n\r\n```javascript\r\nimport { createRouter, createWebHistory } from 'vue-router'\r\n\r\nconst routes = [\r\n  {\r\n    path: '/home',\r\n    name: 'Home',\r\n    component: () => import('@/views/Home'),\r\n    meta: {\r\n      transitionClass: 'back' //左右切换动画\r\n    }\r\n  },\r\n  {\r\n    path: '/about',\r\n    name: 'About',\r\n    component: () => import('@/views/About'),\r\n    meta: {\r\n      transitionClass: 'gradually' //淡入淡出动画\r\n    }\r\n  },\r\n  {\r\n    path: '/test1',\r\n    name: 'Test1',\r\n    component: () => import('@/views/Test1'),\r\n    meta: {\r\n      transitionClass: 'jump' //旋转跳跃动画\r\n    }\r\n  },\r\n  {\r\n    path: '/test2',\r\n    name: 'Test2',\r\n    component: () => import('@/views/Test2'),\r\n    meta: {\r\n      transitionClass: 'fast' //快速切换动画\r\n    }\r\n  },\r\n]\r\n\r\nconst router = createRouter({\r\n  history: createWebHistory(process.env.BASE_URL),\r\n  routes\r\n})\r\n\r\nexport default router\r\n```\r\n\r\n### 3.修改App.vue\r\n\r\n> 核心思路是从route的元信息中取到动画类型，然后给transition标签动态绑定不同的animate动画属性，达到自定义动画切换效果。\r\n\r\n```javascript\r\n<template>\r\n  <router-view class=\"router-view\" v-slot=\"{ Component }\">\r\n    <transition :enter-active-class=\"enterClass\"\r\n                :leave-active-class=\"leaveClass\"\r\n                :duration=\"{ enter: 800, leave: 500 }\">\r\n      <component :is=\"Component\"/>\r\n    </transition>\r\n  </router-view>\r\n</template>\r\n<script>\r\nimport {ref, watch} from \"vue\";\r\nimport {useRoute} from \"vue-router\";\r\nimport animate from \"animate.css\";\r\n\r\nexport default {\r\n  name: \"App\",\r\n  setup() {\r\n    let enterClass = ref('');\r\n    let leaveClass = ref('');\r\n    const route = useRoute();\r\n    // 监控路由的变化\r\n    watch(\r\n        () => route.meta.transitionClass,\r\n        (transitionClass) => {\r\n          // 平滑切换\r\n          if (transitionClass === 'back') {\r\n            enterClass.value = 'animate__animated animate__fadeInRight'\r\n            leaveClass.value = 'animate__animated animate__fadeOutRight'\r\n          }\r\n          // 跳转\r\n          else if (transitionClass === 'jump') {\r\n            enterClass.value = 'animate__animated animate__rollIn'\r\n            leaveClass.value = 'animate__animated animate__rollOut'\r\n          }\r\n          // 渐入\r\n          else if (transitionClass === 'gradually') {\r\n            enterClass.value = 'animate__animated animate__fadeIn'\r\n            leaveClass.value = 'animate__animated animate__fadeOut'\r\n          }\r\n          // 快速切换\r\n          else if (transitionClass === 'fast') {\r\n            enterClass.value = 'animate__animated animate__fadeInRightBig'\r\n            leaveClass.value = 'animate__animated animate__fadeOutRightBig'\r\n          } else {\r\n            enterClass.value = ''\r\n            leaveClass.value = ''\r\n          }\r\n        }\r\n    );\r\n    return {enterClass, leaveClass};\r\n  },\r\n};\r\n</script>\r\n<style lang=\"scss\">\r\n.router-view {\r\n  width: 100%;\r\n  height: auto;\r\n  position: absolute;\r\n  top: 0;\r\n  bottom: 0;\r\n  margin: 0 auto;\r\n  -webkit-overflow-scrolling: touch;\r\n}\r\n</style>\r\n```\r\n\r\n## 三、效果演示\r\n\r\n![222.gif](https://cdn.nlark.com/yuque/0/2021/gif/2308212/1620271853754-da596abe-b440-4c6e-bf1f-d32988d05b8f.gif#align=left&display=inline&height=419&margin=%5Bobject%20Object%5D&name=222.gif&originHeight=419&originWidth=229&size=5019727&status=done&style=none&width=229)\r\n- 图片地址: https://cdn.cuiliangblog.cn/media/markdown/222.gif\r\n- 参考链接\r\n\r\n> animate中文网：[http://www.animate.net.cn/](http://www.animate.net.cn/)\r\n> VUE动画参考官方文档：[https://v3.cn.vuejs.org/guide/transitions-overview.html](https://v3.cn.vuejs.org/guide/transitions-overview.html)",
  "view": 799,
  "like": 200,
  "collect": 0,
  "comment": 0,
  "created_time": "2021-05-06T20:59:58.646198+08:00",
  "modified_time": "2022-05-22T18:10:30.831842+08:00",
  "is_recommend": false,
  "is_release": true,
  "author": 1
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## PATCH 点赞博客文章

PATCH /blog/article/{id}/

> Body 请求参数

```yaml
like: "200"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|
|body|body|object| 否 |none|
|» like|body|string| 是 |none|

> 返回示例

> 成功

```json
{
  "id": 18,
  "category": "前端",
  "category_id": 9,
  "tags": [
    {
      "id": 8,
      "name": "编程开发"
    },
    {
      "id": 9,
      "name": "经验总结"
    }
  ],
  "title": "VUE3添加animate页面切换动画",
  "abstract": "众所周知，animate作为一款优秀的开源CSS动画库，具有使用简单、兼容性强、动画丰富的特点。那么如何在自己的项目中使用炫酷的animate动画，实现页面切换特效呢？本文带你快速上手使用animate动画。",
  "cover": "https://oss.cuiliangblog.cn/articleCover/2021_05_06_11_55_23_331167.jpg",
  "body": "> 众所周知，animate作为一款优秀的开源CSS动画库，具有使用简单、兼容性强、动画丰富的特点。那么如何在自己的项目中使用炫酷的animate动画，实现页面切换特效呢？本文带你快速上手使用animate动画。\r\n\r\n## 一、创建项目与页面\r\n\r\n> 初始化项目后默认有home页面和about页面。为了演示添加不同的动画效果，我们再添加test1和test2页面，并将各个页面使用router-link互相链接跳转。\r\n\r\n### 1. Home.vue\r\n\r\n```vue\r\n<template>\r\n  <div class=\"home\">\r\n    <router-link to=\"/about\">跳转About</router-link>\r\n    <br>\r\n    <router-link to=\"/test1\">跳转Test</router-link>\r\n    <br>\r\n    <router-link to=\"/test2\">跳转Test2</router-link>\r\n    <h1>这是主页</h1>\r\n  </div>\r\n</template>\r\n\r\n<script>\r\nexport default {\r\n  name: 'Home',\r\n}\r\n</script>\r\n<style lang=\"scss\">\r\n.home{\r\n  background-color: skyblue;\r\n  height: 100vh;\r\n}\r\n</style>\r\n```\r\n\r\n### 2. About.vue\r\n\r\n```vue\r\n<template>\r\n  <div class=\"about\">\r\n    <router-link to=\"/home\">跳转Home</router-link>\r\n    <br>\r\n    <router-link to=\"/test1\">跳转Test1</router-link>\r\n    <br>\r\n    <router-link to=\"/test2\">跳转Test2</router-link>\r\n    <h1>这是关于页</h1>\r\n  </div>\r\n</template>\r\n\r\n<script>\r\nexport default {\r\n  name: 'About',\r\n}\r\n</script>\r\n<style lang=\"scss\">\r\n.about{\r\n  background-color: pink;\r\n  height: 100vh;\r\n}\r\n</style>\r\n```\r\n\r\n### 3. Test1.vue\r\n\r\n```vue\r\n<template>\r\n  <div class=\"test1\">\r\n    <router-link to=\"/about\">跳转About</router-link>\r\n    <br>\r\n    <router-link to=\"/home\">跳转Home</router-link>\r\n    <br>\r\n    <router-link to=\"/test2\">跳转Test2</router-link>\r\n    <h1>这是测试页</h1>\r\n  </div>\r\n</template>\r\n\r\n<script>\r\nexport default {\r\n  name: 'Test',\r\n}\r\n</script>\r\n<style lang=\"scss\">\r\n.test1{\r\n  background-color: darkcyan;\r\n  height: 100vh;\r\n}\r\n</style>\r\n```\r\n\r\n### 4. Test2.vue\r\n\r\n```vue\r\n<template>\r\n  <div class=\"test2\">\r\n    <router-link to=\"/about\">跳转About</router-link>\r\n    <br>\r\n    <router-link to=\"/home\">跳转Home</router-link>\r\n    <br>\r\n    <router-link to=\"/test1\">跳转Test1</router-link>\r\n    <h1>这是测试页</h1>\r\n  </div>\r\n</template>\r\n\r\n<script>\r\nexport default {\r\n  name: 'Test',\r\n}\r\n</script>\r\n<style lang=\"scss\">\r\n.test2 {\r\n  background-color: gold;\r\n  height: 100vh;\r\n}\r\n</style>\r\n```\r\n\r\n### 5. router\r\n\r\n```javascript\r\nimport { createRouter, createWebHistory } from 'vue-router'\r\n\r\nconst routes = [\r\n  {\r\n    path: '/home',\r\n    name: 'Home',\r\n    component: () => import('@/views/Home')\r\n  },\r\n  {\r\n    path: '/about',\r\n    name: 'About',\r\n    component: () => import('@/views/About')\r\n  },\r\n  {\r\n    path: '/test1',\r\n    name: 'Test1',\r\n    component: () => import('@/views/Test1')\r\n  },\r\n  {\r\n    path: '/test2',\r\n    name: 'Test2',\r\n    component: () => import('@/views/Test2')\r\n  },\r\n]\r\n\r\nconst router = createRouter({\r\n  history: createWebHistory(process.env.BASE_URL),\r\n  routes\r\n})\r\n\r\nexport default router\r\n```\r\n\r\n## 二、添加动画配置\r\n\r\n### 1. 安装animate.css\r\n\r\n```bash\r\nnpm install animate.css -D\r\n```\r\n\r\n### 2. 修改router，添加动画元信息名称\r\n\r\n> 首先修改router下的index.js，添加meat标签，并定义不同的动画类型，达到自定义不同页面添加不同的动画效果。\r\n\r\n```javascript\r\nimport { createRouter, createWebHistory } from 'vue-router'\r\n\r\nconst routes = [\r\n  {\r\n    path: '/home',\r\n    name: 'Home',\r\n    component: () => import('@/views/Home'),\r\n    meta: {\r\n      transitionClass: 'back' //左右切换动画\r\n    }\r\n  },\r\n  {\r\n    path: '/about',\r\n    name: 'About',\r\n    component: () => import('@/views/About'),\r\n    meta: {\r\n      transitionClass: 'gradually' //淡入淡出动画\r\n    }\r\n  },\r\n  {\r\n    path: '/test1',\r\n    name: 'Test1',\r\n    component: () => import('@/views/Test1'),\r\n    meta: {\r\n      transitionClass: 'jump' //旋转跳跃动画\r\n    }\r\n  },\r\n  {\r\n    path: '/test2',\r\n    name: 'Test2',\r\n    component: () => import('@/views/Test2'),\r\n    meta: {\r\n      transitionClass: 'fast' //快速切换动画\r\n    }\r\n  },\r\n]\r\n\r\nconst router = createRouter({\r\n  history: createWebHistory(process.env.BASE_URL),\r\n  routes\r\n})\r\n\r\nexport default router\r\n```\r\n\r\n### 3.修改App.vue\r\n\r\n> 核心思路是从route的元信息中取到动画类型，然后给transition标签动态绑定不同的animate动画属性，达到自定义动画切换效果。\r\n\r\n```javascript\r\n<template>\r\n  <router-view class=\"router-view\" v-slot=\"{ Component }\">\r\n    <transition :enter-active-class=\"enterClass\"\r\n                :leave-active-class=\"leaveClass\"\r\n                :duration=\"{ enter: 800, leave: 500 }\">\r\n      <component :is=\"Component\"/>\r\n    </transition>\r\n  </router-view>\r\n</template>\r\n<script>\r\nimport {ref, watch} from \"vue\";\r\nimport {useRoute} from \"vue-router\";\r\nimport animate from \"animate.css\";\r\n\r\nexport default {\r\n  name: \"App\",\r\n  setup() {\r\n    let enterClass = ref('');\r\n    let leaveClass = ref('');\r\n    const route = useRoute();\r\n    // 监控路由的变化\r\n    watch(\r\n        () => route.meta.transitionClass,\r\n        (transitionClass) => {\r\n          // 平滑切换\r\n          if (transitionClass === 'back') {\r\n            enterClass.value = 'animate__animated animate__fadeInRight'\r\n            leaveClass.value = 'animate__animated animate__fadeOutRight'\r\n          }\r\n          // 跳转\r\n          else if (transitionClass === 'jump') {\r\n            enterClass.value = 'animate__animated animate__rollIn'\r\n            leaveClass.value = 'animate__animated animate__rollOut'\r\n          }\r\n          // 渐入\r\n          else if (transitionClass === 'gradually') {\r\n            enterClass.value = 'animate__animated animate__fadeIn'\r\n            leaveClass.value = 'animate__animated animate__fadeOut'\r\n          }\r\n          // 快速切换\r\n          else if (transitionClass === 'fast') {\r\n            enterClass.value = 'animate__animated animate__fadeInRightBig'\r\n            leaveClass.value = 'animate__animated animate__fadeOutRightBig'\r\n          } else {\r\n            enterClass.value = ''\r\n            leaveClass.value = ''\r\n          }\r\n        }\r\n    );\r\n    return {enterClass, leaveClass};\r\n  },\r\n};\r\n</script>\r\n<style lang=\"scss\">\r\n.router-view {\r\n  width: 100%;\r\n  height: auto;\r\n  position: absolute;\r\n  top: 0;\r\n  bottom: 0;\r\n  margin: 0 auto;\r\n  -webkit-overflow-scrolling: touch;\r\n}\r\n</style>\r\n```\r\n\r\n## 三、效果演示\r\n\r\n![222.gif](https://cdn.nlark.com/yuque/0/2021/gif/2308212/1620271853754-da596abe-b440-4c6e-bf1f-d32988d05b8f.gif#align=left&display=inline&height=419&margin=%5Bobject%20Object%5D&name=222.gif&originHeight=419&originWidth=229&size=5019727&status=done&style=none&width=229)\r\n- 图片地址: https://cdn.cuiliangblog.cn/media/markdown/222.gif\r\n- 参考链接\r\n\r\n> animate中文网：[http://www.animate.net.cn/](http://www.animate.net.cn/)\r\n> VUE动画参考官方文档：[https://v3.cn.vuejs.org/guide/transitions-overview.html](https://v3.cn.vuejs.org/guide/transitions-overview.html)",
  "view": 794,
  "like": 200,
  "collect": 0,
  "comment": 0,
  "created_time": "2021-05-06T20:59:58.646198+08:00",
  "modified_time": "2022-04-04T21:15:33.543950+08:00",
  "is_recommend": false,
  "is_release": true,
  "author": 1
}
```

```json
{
  "id": 18,
  "category": "前端",
  "category_id": 9,
  "tags": [
    {
      "id": 8,
      "name": "编程开发"
    },
    {
      "id": 9,
      "name": "经验总结"
    }
  ],
  "title": "VUE3添加animate页面切换动画",
  "abstract": "众所周知，animate作为一款优秀的开源CSS动画库，具有使用简单、兼容性强、动画丰富的特点。那么如何在自己的项目中使用炫酷的animate动画，实现页面切换特效呢？本文带你快速上手使用animate动画。",
  "cover": "https://oss.cuiliangblog.cn/articleCover/2021_05_06_11_55_23_331167.jpg",
  "body": "> 众所周知，animate作为一款优秀的开源CSS动画库，具有使用简单、兼容性强、动画丰富的特点。那么如何在自己的项目中使用炫酷的animate动画，实现页面切换特效呢？本文带你快速上手使用animate动画。\r\n\r\n## 一、创建项目与页面\r\n\r\n> 初始化项目后默认有home页面和about页面。为了演示添加不同的动画效果，我们再添加test1和test2页面，并将各个页面使用router-link互相链接跳转。\r\n\r\n### 1. Home.vue\r\n\r\n```vue\r\n<template>\r\n  <div class=\"home\">\r\n    <router-link to=\"/about\">跳转About</router-link>\r\n    <br>\r\n    <router-link to=\"/test1\">跳转Test</router-link>\r\n    <br>\r\n    <router-link to=\"/test2\">跳转Test2</router-link>\r\n    <h1>这是主页</h1>\r\n  </div>\r\n</template>\r\n\r\n<script>\r\nexport default {\r\n  name: 'Home',\r\n}\r\n</script>\r\n<style lang=\"scss\">\r\n.home{\r\n  background-color: skyblue;\r\n  height: 100vh;\r\n}\r\n</style>\r\n```\r\n\r\n### 2. About.vue\r\n\r\n```vue\r\n<template>\r\n  <div class=\"about\">\r\n    <router-link to=\"/home\">跳转Home</router-link>\r\n    <br>\r\n    <router-link to=\"/test1\">跳转Test1</router-link>\r\n    <br>\r\n    <router-link to=\"/test2\">跳转Test2</router-link>\r\n    <h1>这是关于页</h1>\r\n  </div>\r\n</template>\r\n\r\n<script>\r\nexport default {\r\n  name: 'About',\r\n}\r\n</script>\r\n<style lang=\"scss\">\r\n.about{\r\n  background-color: pink;\r\n  height: 100vh;\r\n}\r\n</style>\r\n```\r\n\r\n### 3. Test1.vue\r\n\r\n```vue\r\n<template>\r\n  <div class=\"test1\">\r\n    <router-link to=\"/about\">跳转About</router-link>\r\n    <br>\r\n    <router-link to=\"/home\">跳转Home</router-link>\r\n    <br>\r\n    <router-link to=\"/test2\">跳转Test2</router-link>\r\n    <h1>这是测试页</h1>\r\n  </div>\r\n</template>\r\n\r\n<script>\r\nexport default {\r\n  name: 'Test',\r\n}\r\n</script>\r\n<style lang=\"scss\">\r\n.test1{\r\n  background-color: darkcyan;\r\n  height: 100vh;\r\n}\r\n</style>\r\n```\r\n\r\n### 4. Test2.vue\r\n\r\n```vue\r\n<template>\r\n  <div class=\"test2\">\r\n    <router-link to=\"/about\">跳转About</router-link>\r\n    <br>\r\n    <router-link to=\"/home\">跳转Home</router-link>\r\n    <br>\r\n    <router-link to=\"/test1\">跳转Test1</router-link>\r\n    <h1>这是测试页</h1>\r\n  </div>\r\n</template>\r\n\r\n<script>\r\nexport default {\r\n  name: 'Test',\r\n}\r\n</script>\r\n<style lang=\"scss\">\r\n.test2 {\r\n  background-color: gold;\r\n  height: 100vh;\r\n}\r\n</style>\r\n```\r\n\r\n### 5. router\r\n\r\n```javascript\r\nimport { createRouter, createWebHistory } from 'vue-router'\r\n\r\nconst routes = [\r\n  {\r\n    path: '/home',\r\n    name: 'Home',\r\n    component: () => import('@/views/Home')\r\n  },\r\n  {\r\n    path: '/about',\r\n    name: 'About',\r\n    component: () => import('@/views/About')\r\n  },\r\n  {\r\n    path: '/test1',\r\n    name: 'Test1',\r\n    component: () => import('@/views/Test1')\r\n  },\r\n  {\r\n    path: '/test2',\r\n    name: 'Test2',\r\n    component: () => import('@/views/Test2')\r\n  },\r\n]\r\n\r\nconst router = createRouter({\r\n  history: createWebHistory(process.env.BASE_URL),\r\n  routes\r\n})\r\n\r\nexport default router\r\n```\r\n\r\n## 二、添加动画配置\r\n\r\n### 1. 安装animate.css\r\n\r\n```bash\r\nnpm install animate.css -D\r\n```\r\n\r\n### 2. 修改router，添加动画元信息名称\r\n\r\n> 首先修改router下的index.js，添加meat标签，并定义不同的动画类型，达到自定义不同页面添加不同的动画效果。\r\n\r\n```javascript\r\nimport { createRouter, createWebHistory } from 'vue-router'\r\n\r\nconst routes = [\r\n  {\r\n    path: '/home',\r\n    name: 'Home',\r\n    component: () => import('@/views/Home'),\r\n    meta: {\r\n      transitionClass: 'back' //左右切换动画\r\n    }\r\n  },\r\n  {\r\n    path: '/about',\r\n    name: 'About',\r\n    component: () => import('@/views/About'),\r\n    meta: {\r\n      transitionClass: 'gradually' //淡入淡出动画\r\n    }\r\n  },\r\n  {\r\n    path: '/test1',\r\n    name: 'Test1',\r\n    component: () => import('@/views/Test1'),\r\n    meta: {\r\n      transitionClass: 'jump' //旋转跳跃动画\r\n    }\r\n  },\r\n  {\r\n    path: '/test2',\r\n    name: 'Test2',\r\n    component: () => import('@/views/Test2'),\r\n    meta: {\r\n      transitionClass: 'fast' //快速切换动画\r\n    }\r\n  },\r\n]\r\n\r\nconst router = createRouter({\r\n  history: createWebHistory(process.env.BASE_URL),\r\n  routes\r\n})\r\n\r\nexport default router\r\n```\r\n\r\n### 3.修改App.vue\r\n\r\n> 核心思路是从route的元信息中取到动画类型，然后给transition标签动态绑定不同的animate动画属性，达到自定义动画切换效果。\r\n\r\n```javascript\r\n<template>\r\n  <router-view class=\"router-view\" v-slot=\"{ Component }\">\r\n    <transition :enter-active-class=\"enterClass\"\r\n                :leave-active-class=\"leaveClass\"\r\n                :duration=\"{ enter: 800, leave: 500 }\">\r\n      <component :is=\"Component\"/>\r\n    </transition>\r\n  </router-view>\r\n</template>\r\n<script>\r\nimport {ref, watch} from \"vue\";\r\nimport {useRoute} from \"vue-router\";\r\nimport animate from \"animate.css\";\r\n\r\nexport default {\r\n  name: \"App\",\r\n  setup() {\r\n    let enterClass = ref('');\r\n    let leaveClass = ref('');\r\n    const route = useRoute();\r\n    // 监控路由的变化\r\n    watch(\r\n        () => route.meta.transitionClass,\r\n        (transitionClass) => {\r\n          // 平滑切换\r\n          if (transitionClass === 'back') {\r\n            enterClass.value = 'animate__animated animate__fadeInRight'\r\n            leaveClass.value = 'animate__animated animate__fadeOutRight'\r\n          }\r\n          // 跳转\r\n          else if (transitionClass === 'jump') {\r\n            enterClass.value = 'animate__animated animate__rollIn'\r\n            leaveClass.value = 'animate__animated animate__rollOut'\r\n          }\r\n          // 渐入\r\n          else if (transitionClass === 'gradually') {\r\n            enterClass.value = 'animate__animated animate__fadeIn'\r\n            leaveClass.value = 'animate__animated animate__fadeOut'\r\n          }\r\n          // 快速切换\r\n          else if (transitionClass === 'fast') {\r\n            enterClass.value = 'animate__animated animate__fadeInRightBig'\r\n            leaveClass.value = 'animate__animated animate__fadeOutRightBig'\r\n          } else {\r\n            enterClass.value = ''\r\n            leaveClass.value = ''\r\n          }\r\n        }\r\n    );\r\n    return {enterClass, leaveClass};\r\n  },\r\n};\r\n</script>\r\n<style lang=\"scss\">\r\n.router-view {\r\n  width: 100%;\r\n  height: auto;\r\n  position: absolute;\r\n  top: 0;\r\n  bottom: 0;\r\n  margin: 0 auto;\r\n  -webkit-overflow-scrolling: touch;\r\n}\r\n</style>\r\n```\r\n\r\n## 三、效果演示\r\n\r\n![222.gif](https://cdn.nlark.com/yuque/0/2021/gif/2308212/1620271853754-da596abe-b440-4c6e-bf1f-d32988d05b8f.gif#align=left&display=inline&height=419&margin=%5Bobject%20Object%5D&name=222.gif&originHeight=419&originWidth=229&size=5019727&status=done&style=none&width=229)\r\n- 图片地址: https://cdn.cuiliangblog.cn/media/markdown/222.gif\r\n- 参考链接\r\n\r\n> animate中文网：[http://www.animate.net.cn/](http://www.animate.net.cn/)\r\n> VUE动画参考官方文档：[https://v3.cn.vuejs.org/guide/transitions-overview.html](https://v3.cn.vuejs.org/guide/transitions-overview.html)",
  "view": 794,
  "like": 200,
  "collect": 0,
  "comment": 0,
  "created_time": "2021-05-06T20:59:58.646198+08:00",
  "modified_time": "2022-04-04T21:15:33.543950+08:00",
  "is_recommend": false,
  "is_release": true,
  "author": 1
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 内容管理/文章分类

## GET 查询id对应文章分类名

GET /blog/category/{id}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|

> 返回示例

> 成功

```json
{
  "id": 1,
  "name": "Linux"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 获取全部文章分类

GET /blog/category/

> 返回示例

> 成功

```json
[
  {
    "id": 1,
    "name": "Linux"
  },
  {
    "id": 2,
    "name": "MySQL"
  },
  {
    "id": 3,
    "name": "Python"
  },
  {
    "id": 4,
    "name": "Django"
  },
  {
    "id": 5,
    "name": "Docker"
  },
  {
    "id": 6,
    "name": "Kubernetes"
  },
  {
    "id": 7,
    "name": "CI/CD"
  },
  {
    "id": 8,
    "name": "其他"
  },
  {
    "id": 9,
    "name": "前端"
  },
  {
    "id": 10,
    "name": "Prometheus"
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 内容管理/笔记名称

## GET 获取全部笔记名称

GET /blog/note/

> 返回示例

> 成功

```json
[
  {
    "id": 1,
    "name": "Kubernetes",
    "cover": "https://oss.cuiliangblog.cn/noteCover/kubernetes.png"
  },
  {
    "id": 2,
    "name": "Docker",
    "cover": "https://oss.cuiliangblog.cn/noteCover/docker.jpeg"
  },
  {
    "id": 3,
    "name": "Prometheus",
    "cover": "https://oss.cuiliangblog.cn/noteCover/prometheus.png"
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 获取指定id笔记详情

GET /blog/note/{id}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|

> 返回示例

> 成功

```json
{
  "id": 1,
  "name": "Kubernetes",
  "cover": "https://oss.cuiliangblog.cn/noteCover/kubernetes.png"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 内容管理/猜你喜欢

## GET 获取猜你喜欢文章

GET /blog/guessLike/{id}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |文章ID|

> 返回示例

> 成功

```json
[
  {
    "id": 1,
    "title": "linux运维工程师面试题总结",
    "cover": "https://oss.cuiliangblog.cn/articleCover/2020_12_11_20_32_48_685428.jpg"
  },
  {
    "id": 9,
    "title": "Vue项目上线前优化总结",
    "cover": "https://oss.cuiliangblog.cn/articleCover/2021_02_09_18_47_17_717959.jpg"
  },
  {
    "id": 22,
    "title": "grafana告警与webhook配置",
    "cover": "https://oss.cuiliangblog.cn/articleCover/grafana%E5%91%8A%E8%AD%A6.jpg"
  },
  {
    "id": 7,
    "title": "Django第三方账号登录（QQ、微博、github）",
    "cover": "https://oss.cuiliangblog.cn/articleCover/2020_12_27_18_20_15_014245.jpg"
  }
]
```

```json
[
  {
    "id": 1,
    "title": "linux运维工程师面试题总结",
    "cover": "https://oss.cuiliangblog.cn/articleCover/2020_12_11_20_32_48_685428.jpg"
  },
  {
    "id": 9,
    "title": "Vue项目上线前优化总结",
    "cover": "https://oss.cuiliangblog.cn/articleCover/2021_02_09_18_47_17_717959.jpg"
  },
  {
    "id": 22,
    "title": "grafana告警与webhook配置",
    "cover": "https://oss.cuiliangblog.cn/articleCover/grafana%E5%91%8A%E8%AD%A6.jpg"
  },
  {
    "id": 7,
    "title": "Django第三方账号登录（QQ、微博、github）",
    "cover": "https://oss.cuiliangblog.cn/articleCover/2020_12_27_18_20_15_014245.jpg"
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 内容管理/笔记目录

## GET 获取指定ID的笔记目录结构

GET /blog/catalogueList/{id}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |笔记名称|

> 返回示例

> 成功

```json
[
  {
    "id": 1,
    "name": "基础知识",
    "child": [
      {
        "id": 3,
        "name": "kubernetes特性",
        "section_id": 1
      },
      {
        "id": 4,
        "name": "概念和术语",
        "section_id": 2
      },
      {
        "id": 5,
        "name": "集群组件",
        "section_id": 3
      },
      {
        "id": 6,
        "name": "抽象对象",
        "section_id": 4
      },
      {
        "id": 7,
        "name": "通过阿里云获取gcr.io镜像文件",
        "section_id": 5
      }
    ]
  },
  {
    "id": 2,
    "name": "kubeadm部署k8s",
    "child": [
      {
        "id": 8,
        "name": "前期准备",
        "section_id": 6
      },
      {
        "id": 9,
        "name": "部署kubernets",
        "section_id": 7
      },
      {
        "id": 10,
        "name": "部署helm",
        "section_id": 8
      },
      {
        "id": 11,
        "name": "部署ingress控制器",
        "section_id": 9
      },
      {
        "id": 12,
        "name": "部署calico网络组件",
        "section_id": 10
      },
      {
        "id": 13,
        "name": "部署dashboard",
        "section_id": 11
      },
      {
        "id": 14,
        "name": "部署metrics-server监控组件",
        "section_id": 12
      },
      {
        "id": 15,
        "name": "部署Prometheus+Grafana",
        "section_id": 13
      },
      {
        "id": 16,
        "name": "部署elk日志收集",
        "section_id": 14
      },
      {
        "id": 17,
        "name": "部署Harbor私有镜像仓库",
        "section_id": 15
      }
    ]
  },
  {
    "id": 25,
    "name": "kubectl命令",
    "child": [
      {
        "id": 18,
        "name": "命令格式",
        "section_id": 16
      },
      {
        "id": 19,
        "name": "node常用命令",
        "section_id": 17
      },
      {
        "id": 20,
        "name": "pod常用命令",
        "section_id": 18
      },
      {
        "id": 21,
        "name": "控制器常用命令",
        "section_id": 19
      },
      {
        "id": 23,
        "name": "存储常用命令",
        "section_id": 21
      },
      {
        "id": 22,
        "name": "service常用命令",
        "section_id": 20
      },
      {
        "id": 24,
        "name": "日常命令总结",
        "section_id": 22
      }
    ]
  },
  {
    "id": 26,
    "name": "资源对象",
    "child": [
      {
        "id": 27,
        "name": "K8S中的资源对象",
        "section_id": 23
      },
      {
        "id": 28,
        "name": "yuml文件",
        "section_id": 24
      },
      {
        "id": 29,
        "name": "k8s yaml字段大全",
        "section_id": 25
      },
      {
        "id": 30,
        "name": "管理Namespace资源",
        "section_id": 26
      },
      {
        "id": 31,
        "name": "标签与标签选择器",
        "section_id": 27
      },
      {
        "id": 32,
        "name": "Pod资源对象",
        "section_id": 28
      },
      {
        "id": 33,
        "name": "Pod生命周期",
        "section_id": 29
      },
      {
        "id": 34,
        "name": "资源需求与限制",
        "section_id": 30
      },
      {
        "id": 35,
        "name": "Pod服务质量（优先级）",
        "section_id": 31
      }
    ]
  },
  {
    "id": 36,
    "name": "资源控制器",
    "child": [
      {
        "id": 37,
        "name": "Pod控制器",
        "section_id": 32
      },
      {
        "id": 38,
        "name": "ReplicaSet控制器",
        "section_id": 33
      },
      {
        "id": 39,
        "name": "Deployment控制器",
        "section_id": 34
      },
      {
        "id": 40,
        "name": "DaemonSet控制器",
        "section_id": 35
      },
      {
        "id": 41,
        "name": "Job控制器",
        "section_id": 36
      },
      {
        "id": 42,
        "name": "CronJob控制器",
        "section_id": 37
      },
      {
        "id": 43,
        "name": "StatefulSet控制器",
        "section_id": 38
      },
      {
        "id": 44,
        "name": "PDB中断预算",
        "section_id": 39
      }
    ]
  },
  {
    "id": 45,
    "name": "Service和Ingress",
    "child": [
      {
        "id": 46,
        "name": "Service资源及模型",
        "section_id": 40
      },
      {
        "id": 47,
        "name": "服务发现",
        "section_id": 41
      },
      {
        "id": 48,
        "name": "Service类型",
        "section_id": 42
      },
      {
        "id": 49,
        "name": "Headless Service",
        "section_id": 43
      },
      {
        "id": 50,
        "name": "Ingress资源",
        "section_id": 44
      },
      {
        "id": 51,
        "name": "Ingress案例",
        "section_id": 45
      }
    ]
  },
  {
    "id": 52,
    "name": "存储",
    "child": [
      {
        "id": 53,
        "name": "配置集合ConfigMap",
        "section_id": 46
      },
      {
        "id": 54,
        "name": "敏感信息Secret",
        "section_id": 47
      },
      {
        "id": 55,
        "name": "临时存储emptyDir",
        "section_id": 48
      },
      {
        "id": 56,
        "name": "节点存储hostPath",
        "section_id": 49
      },
      {
        "id": 57,
        "name": "网络存储卷",
        "section_id": 50
      },
      {
        "id": 58,
        "name": "持久存储卷",
        "section_id": 51
      },
      {
        "id": 59,
        "name": "downwardAPI存储卷",
        "section_id": 52
      }
    ]
  },
  {
    "id": 60,
    "name": "rook",
    "child": [
      {
        "id": 61,
        "name": "rook简介",
        "section_id": 53
      },
      {
        "id": 62,
        "name": "ceph",
        "section_id": 54
      },
      {
        "id": 63,
        "name": "rook部署",
        "section_id": 55
      },
      {
        "id": 64,
        "name": "rbd块存储服务",
        "section_id": 56
      },
      {
        "id": 65,
        "name": "cephfs共享文件存储",
        "section_id": 57
      },
      {
        "id": 66,
        "name": "RGW对象存储服务",
        "section_id": 58
      },
      {
        "id": 67,
        "name": "维护rook存储",
        "section_id": 59
      }
    ]
  },
  {
    "id": 68,
    "name": "网络",
    "child": [
      {
        "id": 69,
        "name": "网络概述",
        "section_id": 60
      },
      {
        "id": 70,
        "name": "网络类型",
        "section_id": 61
      },
      {
        "id": 71,
        "name": "flannel网络插件",
        "section_id": 62
      },
      {
        "id": 72,
        "name": "网络策略",
        "section_id": 63
      },
      {
        "id": 73,
        "name": "网络与策略实例",
        "section_id": 64
      }
    ]
  },
  {
    "id": 74,
    "name": "安全",
    "child": [
      {
        "id": 75,
        "name": "访问控制",
        "section_id": 65
      },
      {
        "id": 76,
        "name": "认证",
        "section_id": 66
      },
      {
        "id": 77,
        "name": "鉴权",
        "section_id": 67
      },
      {
        "id": 78,
        "name": "准入控制",
        "section_id": 68
      },
      {
        "id": 79,
        "name": "示例",
        "section_id": 69
      }
    ]
  },
  {
    "id": 80,
    "name": "pod调度",
    "child": [
      {
        "id": 81,
        "name": "调度器概述",
        "section_id": 70
      },
      {
        "id": 82,
        "name": "node亲和调度",
        "section_id": 71
      },
      {
        "id": 83,
        "name": "pod亲和调度",
        "section_id": 72
      },
      {
        "id": 84,
        "name": "污点和容忍度",
        "section_id": 73
      },
      {
        "id": 85,
        "name": "固定节点调度",
        "section_id": 74
      }
    ]
  },
  {
    "id": 86,
    "name": "系统扩展",
    "child": [
      {
        "id": 87,
        "name": "自定义资源类型（CRD）",
        "section_id": 75
      },
      {
        "id": 88,
        "name": "自定义控制器",
        "section_id": 76
      }
    ]
  },
  {
    "id": 89,
    "name": "资源指标与HPA",
    "child": [
      {
        "id": 90,
        "name": "资源监控及资源指标",
        "section_id": 77
      },
      {
        "id": 91,
        "name": "监控组件安装",
        "section_id": 78
      },
      {
        "id": 92,
        "name": "资源指标及其应用",
        "section_id": 79
      },
      {
        "id": 93,
        "name": "自动弹性缩放",
        "section_id": 80
      }
    ]
  },
  {
    "id": 94,
    "name": "helm",
    "child": [
      {
        "id": 95,
        "name": "helm基础",
        "section_id": 81
      },
      {
        "id": 96,
        "name": "helm安装",
        "section_id": 82
      },
      {
        "id": 97,
        "name": "helm常用命令",
        "section_id": 83
      },
      {
        "id": 98,
        "name": "Helm Charts",
        "section_id": 84
      },
      {
        "id": 99,
        "name": "自定义Charts",
        "section_id": 85
      }
    ]
  },
  {
    "id": 104,
    "name": "日常维护",
    "child": [
      {
        "id": 105,
        "name": "更改证书有效期",
        "section_id": 89
      },
      {
        "id": 106,
        "name": "k8s版本升级",
        "section_id": 90
      },
      {
        "id": 107,
        "name": "添加work节点",
        "section_id": 91
      },
      {
        "id": 108,
        "name": "控制节点启用pod调度",
        "section_id": 92
      },
      {
        "id": 109,
        "name": "集群以外节点控制k8s集群",
        "section_id": 93
      },
      {
        "id": 110,
        "name": "删除本地集群",
        "section_id": 94
      },
      {
        "id": 111,
        "name": "日志排查",
        "section_id": 95
      },
      {
        "id": 241,
        "name": "kubeadmin高可用部署",
        "section_id": 205
      }
    ]
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## PUT 编排笔记目录

PUT /blog/catalogueList/{id}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 获取全部笔记目录

GET /blog/catalogue/

> 返回示例

> 成功

```json
[
  {
    "id": 1,
    "name": "基础知识",
    "order": 1,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 2,
    "name": "kubeadm部署k8s",
    "order": 2,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 25,
    "name": "kubectl命令",
    "order": 3,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 26,
    "name": "资源对象",
    "order": 4,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 36,
    "name": "资源控制器",
    "order": 5,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 45,
    "name": "Service和Ingress",
    "order": 6,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 52,
    "name": "存储",
    "order": 7,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 60,
    "name": "rook",
    "order": 8,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 68,
    "name": "网络",
    "order": 9,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 74,
    "name": "安全",
    "order": 10,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 80,
    "name": "pod调度",
    "order": 11,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 86,
    "name": "系统扩展",
    "order": 12,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 89,
    "name": "资源指标与HPA",
    "order": 13,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 94,
    "name": "helm",
    "order": 14,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 104,
    "name": "日常维护",
    "order": 16,
    "level": 1,
    "father": null,
    "note": 1,
    "section": null
  },
  {
    "id": 3,
    "name": "kubernetes特性",
    "order": 1,
    "level": 2,
    "father": 1,
    "note": 1,
    "section": 1
  },
  {
    "id": 8,
    "name": "前期准备",
    "order": 1,
    "level": 2,
    "father": 2,
    "note": 1,
    "section": 6
  },
  {
    "id": 18,
    "name": "命令格式",
    "order": 1,
    "level": 2,
    "father": 25,
    "note": 1,
    "section": 16
  },
  {
    "id": 27,
    "name": "K8S中的资源对象",
    "order": 1,
    "level": 2,
    "father": 26,
    "note": 1,
    "section": 23
  },
  {
    "id": 37,
    "name": "Pod控制器",
    "order": 1,
    "level": 2,
    "father": 36,
    "note": 1,
    "section": 32
  },
  {
    "id": 46,
    "name": "Service资源及模型",
    "order": 1,
    "level": 2,
    "father": 45,
    "note": 1,
    "section": 40
  },
  {
    "id": 53,
    "name": "配置集合ConfigMap",
    "order": 1,
    "level": 2,
    "father": 52,
    "note": 1,
    "section": 46
  },
  {
    "id": 61,
    "name": "rook简介",
    "order": 1,
    "level": 2,
    "father": 60,
    "note": 1,
    "section": 53
  },
  {
    "id": 69,
    "name": "网络概述",
    "order": 1,
    "level": 2,
    "father": 68,
    "note": 1,
    "section": 60
  },
  {
    "id": 75,
    "name": "访问控制",
    "order": 1,
    "level": 2,
    "father": 74,
    "note": 1,
    "section": 65
  },
  {
    "id": 81,
    "name": "调度器概述",
    "order": 1,
    "level": 2,
    "father": 80,
    "note": 1,
    "section": 70
  },
  {
    "id": 87,
    "name": "自定义资源类型（CRD）",
    "order": 1,
    "level": 2,
    "father": 86,
    "note": 1,
    "section": 75
  },
  {
    "id": 90,
    "name": "资源监控及资源指标",
    "order": 1,
    "level": 2,
    "father": 89,
    "note": 1,
    "section": 77
  },
  {
    "id": 95,
    "name": "helm基础",
    "order": 1,
    "level": 2,
    "father": 94,
    "note": 1,
    "section": 81
  },
  {
    "id": 101,
    "name": "kubeadm高可用部署",
    "order": 1,
    "level": 2,
    "father": 100,
    "note": 1,
    "section": 86
  },
  {
    "id": 105,
    "name": "更改证书有效期",
    "order": 1,
    "level": 2,
    "father": 104,
    "note": 1,
    "section": 89
  },
  {
    "id": 4,
    "name": "概念和术语",
    "order": 2,
    "level": 2,
    "father": 1,
    "note": 1,
    "section": 2
  },
  {
    "id": 9,
    "name": "部署kubernets",
    "order": 2,
    "level": 2,
    "father": 2,
    "note": 1,
    "section": 7
  },
  {
    "id": 19,
    "name": "node常用命令",
    "order": 2,
    "level": 2,
    "father": 25,
    "note": 1,
    "section": 17
  },
  {
    "id": 28,
    "name": "yuml文件",
    "order": 2,
    "level": 2,
    "father": 26,
    "note": 1,
    "section": 24
  },
  {
    "id": 38,
    "name": "ReplicaSet控制器",
    "order": 2,
    "level": 2,
    "father": 36,
    "note": 1,
    "section": 33
  },
  {
    "id": 47,
    "name": "服务发现",
    "order": 2,
    "level": 2,
    "father": 45,
    "note": 1,
    "section": 41
  },
  {
    "id": 54,
    "name": "敏感信息Secret",
    "order": 2,
    "level": 2,
    "father": 52,
    "note": 1,
    "section": 47
  },
  {
    "id": 62,
    "name": "ceph",
    "order": 2,
    "level": 2,
    "father": 60,
    "note": 1,
    "section": 54
  },
  {
    "id": 70,
    "name": "网络类型",
    "order": 2,
    "level": 2,
    "father": 68,
    "note": 1,
    "section": 61
  },
  {
    "id": 76,
    "name": "认证",
    "order": 2,
    "level": 2,
    "father": 74,
    "note": 1,
    "section": 66
  },
  {
    "id": 82,
    "name": "node亲和调度",
    "order": 2,
    "level": 2,
    "father": 80,
    "note": 1,
    "section": 71
  },
  {
    "id": 88,
    "name": "自定义控制器",
    "order": 2,
    "level": 2,
    "father": 86,
    "note": 1,
    "section": 76
  },
  {
    "id": 91,
    "name": "监控组件安装",
    "order": 2,
    "level": 2,
    "father": 89,
    "note": 1,
    "section": 78
  },
  {
    "id": 96,
    "name": "helm安装",
    "order": 2,
    "level": 2,
    "father": 94,
    "note": 1,
    "section": 82
  },
  {
    "id": 102,
    "name": "离线二进制部署k8s",
    "order": 2,
    "level": 2,
    "father": 100,
    "note": 1,
    "section": 87
  },
  {
    "id": 106,
    "name": "k8s版本升级",
    "order": 2,
    "level": 2,
    "father": 104,
    "note": 1,
    "section": 90
  },
  {
    "id": 212,
    "name": "自定义Prometheus告警规则",
    "order": 2,
    "level": 2,
    "father": 210,
    "note": 1,
    "section": 178
  },
  {
    "id": 5,
    "name": "集群组件",
    "order": 3,
    "level": 2,
    "father": 1,
    "note": 1,
    "section": 3
  },
  {
    "id": 10,
    "name": "部署helm",
    "order": 3,
    "level": 2,
    "father": 2,
    "note": 1,
    "section": 8
  },
  {
    "id": 20,
    "name": "pod常用命令",
    "order": 3,
    "level": 2,
    "father": 25,
    "note": 1,
    "section": 18
  },
  {
    "id": 29,
    "name": "k8s yaml字段大全",
    "order": 3,
    "level": 2,
    "father": 26,
    "note": 1,
    "section": 25
  },
  {
    "id": 39,
    "name": "Deployment控制器",
    "order": 3,
    "level": 2,
    "father": 36,
    "note": 1,
    "section": 34
  },
  {
    "id": 48,
    "name": "Service类型",
    "order": 3,
    "level": 2,
    "father": 45,
    "note": 1,
    "section": 42
  },
  {
    "id": 55,
    "name": "临时存储emptyDir",
    "order": 3,
    "level": 2,
    "father": 52,
    "note": 1,
    "section": 48
  },
  {
    "id": 63,
    "name": "rook部署",
    "order": 3,
    "level": 2,
    "father": 60,
    "note": 1,
    "section": 55
  },
  {
    "id": 71,
    "name": "flannel网络插件",
    "order": 3,
    "level": 2,
    "father": 68,
    "note": 1,
    "section": 62
  },
  {
    "id": 77,
    "name": "鉴权",
    "order": 3,
    "level": 2,
    "father": 74,
    "note": 1,
    "section": 67
  },
  {
    "id": 83,
    "name": "pod亲和调度",
    "order": 3,
    "level": 2,
    "father": 80,
    "note": 1,
    "section": 72
  },
  {
    "id": 92,
    "name": "资源指标及其应用",
    "order": 3,
    "level": 2,
    "father": 89,
    "note": 1,
    "section": 79
  },
  {
    "id": 97,
    "name": "helm常用命令",
    "order": 3,
    "level": 2,
    "father": 94,
    "note": 1,
    "section": 83
  },
  {
    "id": 103,
    "name": "其他高可用部署方式",
    "order": 3,
    "level": 2,
    "father": 100,
    "note": 1,
    "section": 88
  },
  {
    "id": 107,
    "name": "添加work节点",
    "order": 3,
    "level": 2,
    "father": 104,
    "note": 1,
    "section": 91
  },
  {
    "id": 6,
    "name": "抽象对象",
    "order": 4,
    "level": 2,
    "father": 1,
    "note": 1,
    "section": 4
  },
  {
    "id": 11,
    "name": "部署ingress控制器",
    "order": 4,
    "level": 2,
    "father": 2,
    "note": 1,
    "section": 9
  },
  {
    "id": 21,
    "name": "控制器常用命令",
    "order": 4,
    "level": 2,
    "father": 25,
    "note": 1,
    "section": 19
  },
  {
    "id": 30,
    "name": "管理Namespace资源",
    "order": 4,
    "level": 2,
    "father": 26,
    "note": 1,
    "section": 26
  },
  {
    "id": 40,
    "name": "DaemonSet控制器",
    "order": 4,
    "level": 2,
    "father": 36,
    "note": 1,
    "section": 35
  },
  {
    "id": 49,
    "name": "Headless Service",
    "order": 4,
    "level": 2,
    "father": 45,
    "note": 1,
    "section": 43
  },
  {
    "id": 56,
    "name": "节点存储hostPath",
    "order": 4,
    "level": 2,
    "father": 52,
    "note": 1,
    "section": 49
  },
  {
    "id": 64,
    "name": "rbd块存储服务",
    "order": 4,
    "level": 2,
    "father": 60,
    "note": 1,
    "section": 56
  },
  {
    "id": 72,
    "name": "网络策略",
    "order": 4,
    "level": 2,
    "father": 68,
    "note": 1,
    "section": 63
  },
  {
    "id": 78,
    "name": "准入控制",
    "order": 4,
    "level": 2,
    "father": 74,
    "note": 1,
    "section": 68
  },
  {
    "id": 84,
    "name": "污点和容忍度",
    "order": 4,
    "level": 2,
    "father": 80,
    "note": 1,
    "section": 73
  },
  {
    "id": 93,
    "name": "自动弹性缩放",
    "order": 4,
    "level": 2,
    "father": 89,
    "note": 1,
    "section": 80
  },
  {
    "id": 98,
    "name": "Helm Charts",
    "order": 4,
    "level": 2,
    "father": 94,
    "note": 1,
    "section": 84
  },
  {
    "id": 108,
    "name": "控制节点启用pod调度",
    "order": 4,
    "level": 2,
    "father": 104,
    "note": 1,
    "section": 92
  },
  {
    "id": 7,
    "name": "通过阿里云获取gcr.io镜像文件",
    "order": 5,
    "level": 2,
    "father": 1,
    "note": 1,
    "section": 5
  },
  {
    "id": 12,
    "name": "部署calico网络组件",
    "order": 5,
    "level": 2,
    "father": 2,
    "note": 1,
    "section": 10
  },
  {
    "id": 23,
    "name": "存储常用命令",
    "order": 5,
    "level": 2,
    "father": 25,
    "note": 1,
    "section": 21
  },
  {
    "id": 31,
    "name": "标签与标签选择器",
    "order": 5,
    "level": 2,
    "father": 26,
    "note": 1,
    "section": 27
  },
  {
    "id": 41,
    "name": "Job控制器",
    "order": 5,
    "level": 2,
    "father": 36,
    "note": 1,
    "section": 36
  },
  {
    "id": 50,
    "name": "Ingress资源",
    "order": 5,
    "level": 2,
    "father": 45,
    "note": 1,
    "section": 44
  },
  {
    "id": 57,
    "name": "网络存储卷",
    "order": 5,
    "level": 2,
    "father": 52,
    "note": 1,
    "section": 50
  },
  {
    "id": 65,
    "name": "cephfs共享文件存储",
    "order": 5,
    "level": 2,
    "father": 60,
    "note": 1,
    "section": 57
  },
  {
    "id": 73,
    "name": "网络与策略实例",
    "order": 5,
    "level": 2,
    "father": 68,
    "note": 1,
    "section": 64
  },
  {
    "id": 79,
    "name": "示例",
    "order": 5,
    "level": 2,
    "father": 74,
    "note": 1,
    "section": 69
  },
  {
    "id": 85,
    "name": "固定节点调度",
    "order": 5,
    "level": 2,
    "father": 80,
    "note": 1,
    "section": 74
  },
  {
    "id": 99,
    "name": "自定义Charts",
    "order": 5,
    "level": 2,
    "father": 94,
    "note": 1,
    "section": 85
  },
  {
    "id": 109,
    "name": "集群以外节点控制k8s集群",
    "order": 5,
    "level": 2,
    "father": 104,
    "note": 1,
    "section": 93
  },
  {
    "id": 13,
    "name": "部署dashboard",
    "order": 6,
    "level": 2,
    "father": 2,
    "note": 1,
    "section": 11
  },
  {
    "id": 22,
    "name": "service常用命令",
    "order": 6,
    "level": 2,
    "father": 25,
    "note": 1,
    "section": 20
  },
  {
    "id": 32,
    "name": "Pod资源对象",
    "order": 6,
    "level": 2,
    "father": 26,
    "note": 1,
    "section": 28
  },
  {
    "id": 42,
    "name": "CronJob控制器",
    "order": 6,
    "level": 2,
    "father": 36,
    "note": 1,
    "section": 37
  },
  {
    "id": 51,
    "name": "Ingress案例",
    "order": 6,
    "level": 2,
    "father": 45,
    "note": 1,
    "section": 45
  },
  {
    "id": 58,
    "name": "持久存储卷",
    "order": 6,
    "level": 2,
    "father": 52,
    "note": 1,
    "section": 51
  },
  {
    "id": 66,
    "name": "RGW对象存储服务",
    "order": 6,
    "level": 2,
    "father": 60,
    "note": 1,
    "section": 58
  },
  {
    "id": 110,
    "name": "删除本地集群",
    "order": 6,
    "level": 2,
    "father": 104,
    "note": 1,
    "section": 94
  },
  {
    "id": 14,
    "name": "部署metrics-server监控组件",
    "order": 7,
    "level": 2,
    "father": 2,
    "note": 1,
    "section": 12
  },
  {
    "id": 24,
    "name": "日常命令总结",
    "order": 7,
    "level": 2,
    "father": 25,
    "note": 1,
    "section": 22
  },
  {
    "id": 33,
    "name": "Pod生命周期",
    "order": 7,
    "level": 2,
    "father": 26,
    "note": 1,
    "section": 29
  },
  {
    "id": 43,
    "name": "StatefulSet控制器",
    "order": 7,
    "level": 2,
    "father": 36,
    "note": 1,
    "section": 38
  },
  {
    "id": 59,
    "name": "downwardAPI存储卷",
    "order": 7,
    "level": 2,
    "father": 52,
    "note": 1,
    "section": 52
  },
  {
    "id": 67,
    "name": "维护rook存储",
    "order": 7,
    "level": 2,
    "father": 60,
    "note": 1,
    "section": 59
  },
  {
    "id": 111,
    "name": "日志排查",
    "order": 7,
    "level": 2,
    "father": 104,
    "note": 1,
    "section": 95
  },
  {
    "id": 15,
    "name": "部署Prometheus+Grafana",
    "order": 8,
    "level": 2,
    "father": 2,
    "note": 1,
    "section": 13
  },
  {
    "id": 34,
    "name": "资源需求与限制",
    "order": 8,
    "level": 2,
    "father": 26,
    "note": 1,
    "section": 30
  },
  {
    "id": 44,
    "name": "PDB中断预算",
    "order": 8,
    "level": 2,
    "father": 36,
    "note": 1,
    "section": 39
  },
  {
    "id": 241,
    "name": "kubeadmin高可用部署",
    "order": 8,
    "level": 2,
    "father": 104,
    "note": 1,
    "section": 205
  },
  {
    "id": 16,
    "name": "部署elk日志收集",
    "order": 9,
    "level": 2,
    "father": 2,
    "note": 1,
    "section": 14
  },
  {
    "id": 35,
    "name": "Pod服务质量（优先级）",
    "order": 9,
    "level": 2,
    "father": 26,
    "note": 1,
    "section": 31
  },
  {
    "id": 17,
    "name": "部署Harbor私有镜像仓库",
    "order": 10,
    "level": 2,
    "father": 2,
    "note": 1,
    "section": 15
  },
  {
    "id": 112,
    "name": "基础",
    "order": 1,
    "level": 1,
    "father": null,
    "note": 2,
    "section": null
  },
  {
    "id": 115,
    "name": "镜像",
    "order": 2,
    "level": 1,
    "father": null,
    "note": 2,
    "section": null
  },
  {
    "id": 120,
    "name": "容器",
    "order": 3,
    "level": 1,
    "father": null,
    "note": 2,
    "section": null
  },
  {
    "id": 129,
    "name": "仓库",
    "order": 4,
    "level": 1,
    "father": null,
    "note": 2,
    "section": null
  },
  {
    "id": 133,
    "name": "dockerfile",
    "order": 5,
    "level": 1,
    "father": null,
    "note": 2,
    "section": null
  },
  {
    "id": 140,
    "name": "资源限制",
    "order": 6,
    "level": 1,
    "father": null,
    "note": 2,
    "section": null
  },
  {
    "id": 144,
    "name": "存储管理",
    "order": 7,
    "level": 1,
    "father": null,
    "note": 2,
    "section": null
  },
  {
    "id": 149,
    "name": "网络管理",
    "order": 8,
    "level": 1,
    "father": null,
    "note": 2,
    "section": null
  },
  {
    "id": 160,
    "name": "核心技术",
    "order": 9,
    "level": 1,
    "father": null,
    "note": 2,
    "section": null
  },
  {
    "id": 166,
    "name": "安全",
    "order": 10,
    "level": 1,
    "father": null,
    "note": 2,
    "section": null
  },
  {
    "id": 172,
    "name": "Docker Machine批量安装管理",
    "order": 11,
    "level": 1,
    "father": null,
    "note": 2,
    "section": null
  },
  {
    "id": 175,
    "name": "Docker Compose容器编排",
    "order": 12,
    "level": 1,
    "father": null,
    "note": 2,
    "section": null
  },
  {
    "id": 181,
    "name": "Docker Swarm集群管理",
    "order": 13,
    "level": 1,
    "father": null,
    "note": 2,
    "section": null
  },
  {
    "id": 186,
    "name": "docker其他与总结",
    "order": 14,
    "level": 1,
    "father": null,
    "note": 2,
    "section": null
  },
  {
    "id": 113,
    "name": "docker基础",
    "order": 1,
    "level": 2,
    "father": 112,
    "note": 2,
    "section": 96
  },
  {
    "id": 116,
    "name": "镜像操作命令",
    "order": 1,
    "level": 2,
    "father": 115,
    "note": 2,
    "section": 98
  },
  {
    "id": 121,
    "name": "容器操作命令总结",
    "order": 1,
    "level": 2,
    "father": 120,
    "note": 2,
    "section": 102
  },
  {
    "id": 130,
    "name": "docker hub公共仓库",
    "order": 1,
    "level": 2,
    "father": 129,
    "note": 2,
    "section": 110
  },
  {
    "id": 134,
    "name": "基本结构",
    "order": 1,
    "level": 2,
    "father": 133,
    "note": 2,
    "section": 113
  },
  {
    "id": 141,
    "name": "内存限制",
    "order": 1,
    "level": 2,
    "father": 140,
    "note": 2,
    "section": 119
  },
  {
    "id": 145,
    "name": "存储管理常用命令",
    "order": 1,
    "level": 2,
    "father": 144,
    "note": 2,
    "section": 122
  },
  {
    "id": 150,
    "name": "端口映射",
    "order": 1,
    "level": 2,
    "father": 149,
    "note": 2,
    "section": 126
  },
  {
    "id": 161,
    "name": "基本架构",
    "order": 1,
    "level": 2,
    "father": 160,
    "note": 2,
    "section": 136
  },
  {
    "id": 167,
    "name": "命名空间隔离的安全",
    "order": 1,
    "level": 2,
    "father": 166,
    "note": 2,
    "section": 141
  },
  {
    "id": 173,
    "name": "安装Docker Machine",
    "order": 1,
    "level": 2,
    "father": 172,
    "note": 2,
    "section": 146
  },
  {
    "id": 176,
    "name": "Docker Compose简介",
    "order": 1,
    "level": 2,
    "father": 175,
    "note": 2,
    "section": 148
  },
  {
    "id": 182,
    "name": "Docker Swarm简介",
    "order": 1,
    "level": 2,
    "father": 181,
    "note": 2,
    "section": 153
  },
  {
    "id": 187,
    "name": "Docker图形化管理",
    "order": 1,
    "level": 2,
    "father": 186,
    "note": 2,
    "section": 157
  },
  {
    "id": 114,
    "name": "docker安装与卸载",
    "order": 2,
    "level": 2,
    "father": 112,
    "note": 2,
    "section": 97
  },
  {
    "id": 117,
    "name": "管理镜像",
    "order": 2,
    "level": 2,
    "father": 115,
    "note": 2,
    "section": 99
  },
  {
    "id": 122,
    "name": "创建容器",
    "order": 2,
    "level": 2,
    "father": 120,
    "note": 2,
    "section": 103
  },
  {
    "id": 131,
    "name": "registry私有仓库",
    "order": 2,
    "level": 2,
    "father": 129,
    "note": 2,
    "section": 111
  },
  {
    "id": 135,
    "name": "配置命令",
    "order": 2,
    "level": 2,
    "father": 133,
    "note": 2,
    "section": 114
  },
  {
    "id": 142,
    "name": "CPU限制",
    "order": 2,
    "level": 2,
    "father": 140,
    "note": 2,
    "section": 120
  },
  {
    "id": 146,
    "name": "数据卷",
    "order": 2,
    "level": 2,
    "father": 144,
    "note": 2,
    "section": 123
  },
  {
    "id": 151,
    "name": "容器互联",
    "order": 2,
    "level": 2,
    "father": 149,
    "note": 2,
    "section": 127
  },
  {
    "id": 162,
    "name": "命名空间",
    "order": 2,
    "level": 2,
    "father": 160,
    "note": 2,
    "section": 137
  },
  {
    "id": 168,
    "name": "控制组资源控制的安全",
    "order": 2,
    "level": 2,
    "father": 166,
    "note": 2,
    "section": 142
  },
  {
    "id": 174,
    "name": "管理machine",
    "order": 2,
    "level": 2,
    "father": 172,
    "note": 2,
    "section": 147
  },
  {
    "id": 177,
    "name": "compose模板文件",
    "order": 2,
    "level": 2,
    "father": 175,
    "note": 2,
    "section": 149
  },
  {
    "id": 183,
    "name": "部署swarm集群",
    "order": 2,
    "level": 2,
    "father": 181,
    "note": 2,
    "section": 154
  },
  {
    "id": 188,
    "name": "docker system命令",
    "order": 2,
    "level": 2,
    "father": 186,
    "note": 2,
    "section": 158
  },
  {
    "id": 118,
    "name": "构建镜像",
    "order": 3,
    "level": 2,
    "father": 115,
    "note": 2,
    "section": 100
  },
  {
    "id": 123,
    "name": "停止容器",
    "order": 3,
    "level": 2,
    "father": 120,
    "note": 2,
    "section": 104
  },
  {
    "id": 132,
    "name": "Harbor私有镜像仓库",
    "order": 3,
    "level": 2,
    "father": 129,
    "note": 2,
    "section": 112
  },
  {
    "id": 136,
    "name": "操作命令",
    "order": 3,
    "level": 2,
    "father": 133,
    "note": 2,
    "section": 115
  },
  {
    "id": 143,
    "name": "限制磁盘IO",
    "order": 3,
    "level": 2,
    "father": 140,
    "note": 2,
    "section": 121
  },
  {
    "id": 147,
    "name": "数据卷容器",
    "order": 3,
    "level": 2,
    "father": 144,
    "note": 2,
    "section": 124
  },
  {
    "id": 152,
    "name": "为镜像添加SSH服务",
    "order": 3,
    "level": 2,
    "father": 149,
    "note": 2,
    "section": 128
  },
  {
    "id": 163,
    "name": "控制组",
    "order": 3,
    "level": 2,
    "father": 160,
    "note": 2,
    "section": 138
  },
  {
    "id": 169,
    "name": "内核能力机制",
    "order": 3,
    "level": 2,
    "father": 166,
    "note": 2,
    "section": 143
  },
  {
    "id": 178,
    "name": "compose命令",
    "order": 3,
    "level": 2,
    "father": 175,
    "note": 2,
    "section": 150
  },
  {
    "id": 184,
    "name": "swarm高可用",
    "order": 3,
    "level": 2,
    "father": 181,
    "note": 2,
    "section": 155
  },
  {
    "id": 189,
    "name": "docker镜像常见问题",
    "order": 3,
    "level": 2,
    "father": 186,
    "note": 2,
    "section": 159
  },
  {
    "id": 119,
    "name": "导出和导入镜像",
    "order": 4,
    "level": 2,
    "father": 115,
    "note": 2,
    "section": 101
  },
  {
    "id": 124,
    "name": "进入容器",
    "order": 4,
    "level": 2,
    "father": 120,
    "note": 2,
    "section": 105
  },
  {
    "id": 137,
    "name": "命令区别",
    "order": 4,
    "level": 2,
    "father": 133,
    "note": 2,
    "section": 116
  },
  {
    "id": 148,
    "name": "利用数据卷容器进行数据迁移",
    "order": 4,
    "level": 2,
    "father": 144,
    "note": 2,
    "section": 125
  },
  {
    "id": 153,
    "name": "docker网络管理",
    "order": 4,
    "level": 2,
    "father": 149,
    "note": 2,
    "section": 129
  },
  {
    "id": 164,
    "name": "联合文件系统",
    "order": 4,
    "level": 2,
    "father": 160,
    "note": 2,
    "section": 139
  },
  {
    "id": 170,
    "name": "Docker服务端的防护",
    "order": 4,
    "level": 2,
    "father": 166,
    "note": 2,
    "section": 144
  },
  {
    "id": 179,
    "name": "compose环境变量",
    "order": 4,
    "level": 2,
    "father": 175,
    "note": 2,
    "section": 151
  },
  {
    "id": 185,
    "name": "service访问",
    "order": 4,
    "level": 2,
    "father": 181,
    "note": 2,
    "section": 156
  },
  {
    "id": 190,
    "name": "docker容器常见问题",
    "order": 4,
    "level": 2,
    "father": 186,
    "note": 2,
    "section": 160
  },
  {
    "id": 125,
    "name": "删除容器",
    "order": 5,
    "level": 2,
    "father": 120,
    "note": 2,
    "section": 106
  },
  {
    "id": 138,
    "name": "构建镜像",
    "order": 5,
    "level": 2,
    "father": 133,
    "note": 2,
    "section": 117
  },
  {
    "id": 154,
    "name": "配置DNS和主机名",
    "order": 5,
    "level": 2,
    "father": 149,
    "note": 2,
    "section": 130
  },
  {
    "id": 165,
    "name": "网络虚拟化",
    "order": 5,
    "level": 2,
    "father": 160,
    "note": 2,
    "section": 140
  },
  {
    "id": 171,
    "name": "其他安全特性",
    "order": 5,
    "level": 2,
    "father": 166,
    "note": 2,
    "section": 145
  },
  {
    "id": 180,
    "name": "compose案例",
    "order": 5,
    "level": 2,
    "father": 175,
    "note": 2,
    "section": 152
  },
  {
    "id": 191,
    "name": "docker仓库常见问题",
    "order": 5,
    "level": 2,
    "father": 186,
    "note": 2,
    "section": 161
  },
  {
    "id": 126,
    "name": "导入和导出容器",
    "order": 6,
    "level": 2,
    "father": 120,
    "note": 2,
    "section": 107
  },
  {
    "id": 155,
    "name": "容器防火墙访问控制",
    "order": 6,
    "level": 2,
    "father": 149,
    "note": 2,
    "section": 131
  },
  {
    "id": 192,
    "name": "docker配置常见问题",
    "order": 6,
    "level": 2,
    "father": 186,
    "note": 2,
    "section": 162
  },
  {
    "id": 240,
    "name": "dockerfile多个from",
    "order": 6,
    "level": 2,
    "father": 133,
    "note": 2,
    "section": 204
  },
  {
    "id": 127,
    "name": "查看容器",
    "order": 7,
    "level": 2,
    "father": 120,
    "note": 2,
    "section": 108
  },
  {
    "id": 139,
    "name": "dockerfile编写注意事项",
    "order": 7,
    "level": 2,
    "father": 133,
    "note": 2,
    "section": 118
  },
  {
    "id": 156,
    "name": "docker网络分析",
    "order": 7,
    "level": 2,
    "father": 149,
    "note": 2,
    "section": 132
  },
  {
    "id": 193,
    "name": "docker其他问题",
    "order": 7,
    "level": 2,
    "father": 186,
    "note": 2,
    "section": 163
  },
  {
    "id": 128,
    "name": "其他容器命令",
    "order": 8,
    "level": 2,
    "father": 120,
    "note": 2,
    "section": 109
  },
  {
    "id": 157,
    "name": "docker网络类型",
    "order": 8,
    "level": 2,
    "father": 149,
    "note": 2,
    "section": 133
  },
  {
    "id": 194,
    "name": "docker命令总结",
    "order": 8,
    "level": 2,
    "father": 186,
    "note": 2,
    "section": 164
  },
  {
    "id": 158,
    "name": "自定义网络",
    "order": 9,
    "level": 2,
    "father": 149,
    "note": 2,
    "section": 134
  },
  {
    "id": 159,
    "name": "docker网络模型",
    "order": 10,
    "level": 2,
    "father": 149,
    "note": 2,
    "section": 135
  },
  {
    "id": 195,
    "name": "prometheus基础",
    "order": 1,
    "level": 1,
    "father": null,
    "note": 3,
    "section": null
  },
  {
    "id": 201,
    "name": "PromQL",
    "order": 2,
    "level": 1,
    "father": null,
    "note": 3,
    "section": null
  },
  {
    "id": 210,
    "name": "告警处理",
    "order": 3,
    "level": 1,
    "father": null,
    "note": 3,
    "section": null
  },
  {
    "id": 209,
    "name": "exporter",
    "order": 4,
    "level": 1,
    "father": null,
    "note": 3,
    "section": null
  },
  {
    "id": 225,
    "name": "grafana",
    "order": 5,
    "level": 1,
    "father": null,
    "note": 3,
    "section": null
  },
  {
    "id": 234,
    "name": "prometheus高可用",
    "order": 6,
    "level": 1,
    "father": null,
    "note": 3,
    "section": null
  },
  {
    "id": 196,
    "name": "prometheus简介",
    "order": 1,
    "level": 2,
    "father": 195,
    "note": 3,
    "section": 165
  },
  {
    "id": 202,
    "name": "查询表达式",
    "order": 1,
    "level": 2,
    "father": 201,
    "note": 3,
    "section": 170
  },
  {
    "id": 211,
    "name": "告警简介",
    "order": 1,
    "level": 2,
    "father": 210,
    "note": 3,
    "section": 177
  },
  {
    "id": 220,
    "name": "exporter",
    "order": 1,
    "level": 2,
    "father": 209,
    "note": 3,
    "section": 186
  },
  {
    "id": 226,
    "name": "grafana基本概念",
    "order": 1,
    "level": 2,
    "father": 225,
    "note": 3,
    "section": 191
  },
  {
    "id": 235,
    "name": "本地存储",
    "order": 1,
    "level": 2,
    "father": 234,
    "note": 3,
    "section": 199
  },
  {
    "id": 197,
    "name": "部署prometheus",
    "order": 2,
    "level": 2,
    "father": 195,
    "note": 3,
    "section": 166
  },
  {
    "id": 203,
    "name": "操作符",
    "order": 2,
    "level": 2,
    "father": 201,
    "note": 3,
    "section": 171
  },
  {
    "id": 221,
    "name": "容器监控：cAdvisor",
    "order": 2,
    "level": 2,
    "father": 209,
    "note": 3,
    "section": 187
  },
  {
    "id": 227,
    "name": "创建dashboard与Panel",
    "order": 2,
    "level": 2,
    "father": 225,
    "note": 3,
    "section": 192
  },
  {
    "id": 236,
    "name": "远程存储",
    "order": 2,
    "level": 2,
    "father": 234,
    "note": 3,
    "section": 200
  },
  {
    "id": 198,
    "name": "数据模型",
    "order": 3,
    "level": 2,
    "father": 195,
    "note": 3,
    "section": 167
  },
  {
    "id": 204,
    "name": "匹配模式",
    "order": 3,
    "level": 2,
    "father": 201,
    "note": 3,
    "section": 172
  },
  {
    "id": 213,
    "name": "部署Alertmanager",
    "order": 3,
    "level": 2,
    "father": 210,
    "note": 3,
    "section": 179
  },
  {
    "id": 222,
    "name": "监控MySQL：MySQLD Exporter",
    "order": 3,
    "level": 2,
    "father": 209,
    "note": 3,
    "section": 188
  },
  {
    "id": 228,
    "name": "变化趋势：Graph面板",
    "order": 3,
    "level": 2,
    "father": 225,
    "note": 3,
    "section": 193
  },
  {
    "id": 237,
    "name": "联邦集群",
    "order": 3,
    "level": 2,
    "father": 234,
    "note": 3,
    "section": 201
  },
  {
    "id": 199,
    "name": "指标类型",
    "order": 4,
    "level": 2,
    "father": 195,
    "note": 3,
    "section": 168
  },
  {
    "id": 205,
    "name": "聚合操作",
    "order": 4,
    "level": 2,
    "father": 201,
    "note": 3,
    "section": 173
  },
  {
    "id": 214,
    "name": "Alertmanager配置概述",
    "order": 4,
    "level": 2,
    "father": 210,
    "note": 3,
    "section": 180
  },
  {
    "id": 223,
    "name": "网络探测：Blackbox Exporter",
    "order": 4,
    "level": 2,
    "father": 209,
    "note": 3,
    "section": 189
  },
  {
    "id": 229,
    "name": "graph面板常用操作",
    "order": 4,
    "level": 2,
    "father": 225,
    "note": 3,
    "section": 194
  },
  {
    "id": 238,
    "name": "prometheus高可用",
    "order": 4,
    "level": 2,
    "father": 234,
    "note": 3,
    "section": 202
  },
  {
    "id": 200,
    "name": "Jobs和Instances",
    "order": 5,
    "level": 2,
    "father": 195,
    "note": 3,
    "section": 169
  },
  {
    "id": 206,
    "name": "内置函数",
    "order": 5,
    "level": 2,
    "father": 201,
    "note": 3,
    "section": 174
  },
  {
    "id": 215,
    "name": "基于标签的告警处理路由",
    "order": 5,
    "level": 2,
    "father": 210,
    "note": 3,
    "section": 181
  },
  {
    "id": 224,
    "name": "Pushgateway",
    "order": 5,
    "level": 2,
    "father": 209,
    "note": 3,
    "section": 190
  },
  {
    "id": 230,
    "name": "分布统计：Heatmap面板",
    "order": 5,
    "level": 2,
    "father": 225,
    "note": 3,
    "section": 195
  },
  {
    "id": 239,
    "name": "Alertmanager高可用",
    "order": 5,
    "level": 2,
    "father": 234,
    "note": 3,
    "section": 203
  },
  {
    "id": 207,
    "name": "在HTTP API中使用PromQL",
    "order": 6,
    "level": 2,
    "father": 201,
    "note": 3,
    "section": 175
  },
  {
    "id": 216,
    "name": "使用Receiver接收告警信息",
    "order": 6,
    "level": 2,
    "father": 210,
    "note": 3,
    "section": 182
  },
  {
    "id": 231,
    "name": "当前状态：SingleStat面板",
    "order": 6,
    "level": 2,
    "father": 225,
    "note": 3,
    "section": 196
  },
  {
    "id": 208,
    "name": "最佳实践",
    "order": 7,
    "level": 2,
    "father": 201,
    "note": 3,
    "section": 176
  },
  {
    "id": 217,
    "name": "自定义告警模板",
    "order": 7,
    "level": 2,
    "father": 210,
    "note": 3,
    "section": 183
  },
  {
    "id": 232,
    "name": "变量",
    "order": 7,
    "level": 2,
    "father": 225,
    "note": 3,
    "section": 197
  },
  {
    "id": 218,
    "name": "屏蔽告警通知",
    "order": 8,
    "level": 2,
    "father": 210,
    "note": 3,
    "section": 184
  },
  {
    "id": 233,
    "name": "grafana报警",
    "order": 8,
    "level": 2,
    "father": 225,
    "note": 3,
    "section": 198
  },
  {
    "id": 219,
    "name": "使用Recoding Rules优化性能",
    "order": 9,
    "level": 2,
    "father": 210,
    "note": 3,
    "section": 185
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## POST 新增笔记章节名称

POST /blog/catalogue/

> Body 请求参数

```yaml
name: 高可用了啊
note: "3"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» name|body|string| 是 |none|
|» note|body|string| 是 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## DELETE 删除笔记章节名称

DELETE /blog/catalogue/{id}/

> Body 请求参数

```yaml
{}

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|
|body|body|object| 否 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## PUT 修改笔记章节名称

PUT /blog/catalogue/{id}/

> Body 请求参数

```yaml
name: 高可用

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|
|body|body|object| 否 |none|
|» name|body|string| 是 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 内容管理/笔记内容

## PATCH 点赞笔记内容

PATCH /blog/section/{id}/

> Body 请求参数

```yaml
like: "100"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |笔记内容id|
|body|body|object| 否 |none|
|» like|body|string| 是 |none|

> 返回示例

> 成功

```json
{
  "id": 1,
  "note": "Kubernetes",
  "note_id": 1,
  "title": "Kubernetes特性",
  "body": ">Kubernetes是一种用于在一组主机上运行和协同容器化应用程序的系统，旨在提供可预测性、可扩展性与高可用性的方法来完全管理容器化应用程序和服务的生命周期的平台。\n用户可以定义应用程序的运行方式，以及与其他应用程序或外部世界交互的途径，并能实现服务的扩容和缩容，执行平滑滚动更新，以及在不同版本的应用程序之间调度流量以测试功能或回滚有问题的部署。Kubernetes提供了接口和可组合的平台原语，使得用户能够以高度的灵活性和可靠性定义及管理应用程序。简单总结起来，它具有以下几个重要特性。\n\n1. 自动装箱\n   建构于容器之上，基于资源依赖及其他约束自动完成容器部署且不影响其可用性，并通过调度机制混合关键型应用和非关键型应用的工作负载于同一节点以提升资源利用率。\n1. 自我修复（自愈）\n   支持容器故障后自动重启、节点故障后重新调度容器，以及其他可用节点、健康状态检查失败后关闭容器并重新创建等自我修复机制。\n1. 水平扩展\n   支持通过简单命令或UI手动水平扩展，以及基于CPU等资源负载率的自动水平扩展机制。\n1. 服务发现和负载均衡\n   Kubernetes通过其附加组件之一的KubeDNS（或CoreDNS）为系统内置了服务发现功能，它会为每个Service配置DNS名称，并允许集群内的客户端直接使用此名称发出访问请求，而Service则通过iptables或ipvs内建了负载均衡机制。\n1. 自动发布和回滚\n   Kubernetes支持“灰度”更新应用程序或其配置信息，它会监控更新过程中应用程序的健康状态，以确保它不会在同一时刻杀掉所有实例，而此过程中一旦有故障发生，就会立即自动执行回滚操作。\n1. 密钥和配置管理\n   Kubernetes的ConfigMap实现了配置数据与Docker镜像解耦，需要时，仅对配置做出变更而无须重新构建Docker镜像，这为应用开发部署带来了很大的灵活性。此外，对于应用所依赖的一些敏感数据，如用户名和密码、令牌、密钥等信息，Kubernetes专门提供了Secret对象为其解耦，既便利了应用的快速开发和交付，又提供了一定程度上的安全保障。\n1. 存储编排\n   Kubernetes支持Pod对象按需自动挂载不同类型的存储系统，这包括节点本地存储、公有云服务商的云存储（如AWS和GCP等），以及网络存储系统（例如，NFS、iSCSI、GlusterFS、Ceph、Cinder和Flocker等）。\n1. 批量处理执行\n   除了服务型应用，Kubernetes还支持批处理作业及CI（持续集成），如果需要，一样可以实现容器故障后恢复。",
  "view": 639,
  "like": 100,
  "collect": 0,
  "comment": 6,
  "created_time": "2020-12-09T05:38:30.784809+08:00",
  "modified_time": "2022-04-04T21:57:17.168505+08:00",
  "is_release": true,
  "author": 1
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 获取笔记内容详情

GET /blog/section/{id}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |笔记内容id|

> 返回示例

> 成功

```json
{
  "id": 113,
  "note": "Docker",
  "note_id": 2,
  "title": "基本结构",
  "body": "\n\n1. 组成\n   • 基础镜像信息\n   • 维护者信息\n   • 镜像操作指令\n   • 容器启动时执行的指令\n1. 示例\n\n```dockerfile\n#Nginx dockerfile\n#Base images\nFROM centos\n#MAINTAINER 维护人\nMAINTAINER kehaojian\n#ADD 添加本地文件到镜像\nADD pcre-8.37.tar.gz /usr/local/src\nADD nginx-1.9.3.tar.gz /usr/local/src\n#RUN 在镜像中执行命令\nRUN yum install -y wget gcc_c++ make openssl-devel\nRUN useradd -s /sbin/nologin -M www\n#WORKDIR 镜像中切换到目录\nWORKDIR /usr/local/src/nginx-1.9.3\nRUN yum install -y gcc gcc-c++\nRUN ./configure --prefix=/usr/local/nginx --user=www --group=www --with-http_ssl_module --with-http_stub_status_module --with-pcre=/usr/local/src/pcre-8.37 && make && make install\nRUN echo \"daemon off;\">>/usr/local/nginx/conf/nginx.conf\n#配置环境变量\nENV PATH /usr/local/nginx/sbin:$PATH\nEXPOSE 80\n#命令\nCMD  [\"nginx\"]\n```\n\n",
  "view": 87,
  "like": 0,
  "collect": 0,
  "comment": 0,
  "created_time": "2020-12-31T06:29:27.740148+08:00",
  "modified_time": "2022-04-04T21:54:17.824338+08:00",
  "is_release": true,
  "author": 1
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 内容管理/文章笔记前后篇

## GET 查询笔记上一篇下一篇

GET /blog/context/{id}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|
|kind|query|string| 是 |种类（文章、笔记）|

> 返回示例

> 成功

```json
{
  "last": {
    "id": 16,
    "title": "命令格式"
  },
  "next": {
    "id": 18,
    "title": "pod常用命令"
  }
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 内容管理/文章标签

## GET 获取指定标签

GET /blog/tag/{id}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|

> 返回示例

> 成功

```json
{
  "id": 1,
  "name": "入门简介"
}
```

```json
{
  "id": 1,
  "name": "入门简介"
}
```

```json
{
  "id": 1,
  "name": "入门简介"
}
```

```json
{
  "id": 1,
  "name": "入门简介"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 获取所有文章标签

GET /blog/tag

> 返回示例

> 成功

```json
[
  {
    "id": 1,
    "name": "入门简介"
  },
  {
    "id": 2,
    "name": "实验案例"
  },
  {
    "id": 3,
    "name": "理论基础"
  },
  {
    "id": 4,
    "name": "容器"
  },
  {
    "id": 5,
    "name": "数据库"
  },
  {
    "id": 6,
    "name": "服务部署"
  },
  {
    "id": 8,
    "name": "编程开发"
  },
  {
    "id": 9,
    "name": "经验总结"
  }
]
```

```json
[
  {
    "id": 1,
    "name": "入门简介"
  },
  {
    "id": 2,
    "name": "实验案例"
  },
  {
    "id": 3,
    "name": "理论基础"
  },
  {
    "id": 4,
    "name": "容器"
  },
  {
    "id": 5,
    "name": "数据库"
  },
  {
    "id": 6,
    "name": "服务部署"
  },
  {
    "id": 8,
    "name": "编程开发"
  },
  {
    "id": 9,
    "name": "经验总结"
  }
]
```

```json
[
  {
    "id": 1,
    "name": "入门简介"
  },
  {
    "id": 2,
    "name": "实验案例"
  },
  {
    "id": 3,
    "name": "理论基础"
  },
  {
    "id": 4,
    "name": "容器"
  },
  {
    "id": 5,
    "name": "数据库"
  },
  {
    "id": 6,
    "name": "服务部署"
  },
  {
    "id": 8,
    "name": "编程开发"
  },
  {
    "id": 9,
    "name": "经验总结"
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 内容管理/文章归档

## GET 获取文章归档列表

GET /blog/classify/

> 返回示例

> 成功

```json
[
  {
    "month": "2022-04",
    "count": 1
  },
  {
    "month": "2022-03",
    "count": 3
  },
  {
    "month": "2022-02",
    "count": 2
  },
  {
    "month": "2022-01",
    "count": 1
  },
  {
    "month": "2021-12",
    "count": 1
  },
  {
    "month": "2021-11",
    "count": 3
  },
  {
    "month": "2021-10",
    "count": 2
  },
  {
    "month": "2021-09",
    "count": 2
  },
  {
    "month": "2021-08",
    "count": 4
  },
  {
    "month": "2021-07",
    "count": 1
  },
  {
    "month": "2021-06",
    "count": 2
  },
  {
    "month": "2021-05",
    "count": 1
  },
  {
    "month": "2021-04",
    "count": 3
  },
  {
    "month": "2021-03",
    "count": 4
  },
  {
    "month": "2021-02",
    "count": 3
  },
  {
    "month": "2021-01",
    "count": 5
  },
  {
    "month": "2020-12",
    "count": 1
  },
  {
    "month": "2020-11",
    "count": 4
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 内容管理/文章分享

## GET 获取文章二维码

GET /blog/QRcode/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|url|query|string| 是 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 用户管理/用户登录

## GET 获取第三方登录应用ID

GET /account/OAuthID/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|platform|query|string| 是 |第三方登录平台名称|
|kind|query|string| 是 |项目类型pc或m|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## POST 第三方登录后回调地址

POST /account/OAuthCallback/

> Body 请求参数

```yaml
platform: WEIBO
kind: PC
redirect_uri: http://127.0.0.1:3000/OAuth_pc/WEIBO
code: 2768173ee325a4100984771de514ea07

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» platform|body|string| 是 |none|
|» kind|body|string| 是 |none|
|» redirect_uri|body|string| 是 |none|
|» code|body|string| 是 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## POST 用户登录

POST /account/login/

> Body 请求参数

```yaml
username: adc
password: 123321qwer

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» username|body|string| 是 |none|
|» password|body|string| 是 |none|

> 返回示例

> 成功

```json
{
  "refresh": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0OTQyMDc5OSwianRpIjoiZDg1YzEzNGE5OGZjNGQxNDlkZGYxMDhiNDg1YzM0YmEiLCJ1c2VyX2lkIjo2fQ.SRanY_9v9ZOon2p3MvOONOXW04b3Y_3uIELz83dw5v8",
  "access": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQ5OTM5MTk5LCJqdGkiOiI1OWY5OWJhOWI0MDA0MzBkYTRhZGE4OTU2NTE3MzUyMSIsInVzZXJfaWQiOjZ9.OWeylV_NVcD77d9yXHRH1qjjD18nJtuFzKr9Wm8gtps",
  "username": "adc",
  "user_id": 6
}
```

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQ5OTQxODM2LCJqdGkiOiIwMzdkNmI0ZDhjYTU0NDFmYWM2YWM4ZGMzMWI0MWY0NyIsInVzZXJfaWQiOjZ9.vyRdt6ZtATA7UCJJDpv1N0J1S72lm3MUa-y3OcolaAs",
  "user_id": 6,
  "username": "adc"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 用户管理/用户注册

## POST 用户注册

POST /account/register/

> Body 请求参数

```yaml
username: adc
contact: "17793666696"
code: "1112233"
password: 123.com

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» username|body|string| 是 |用户名|
|» contact|body|string| 是 |联系方式|
|» code|body|string| 是 |验证码|
|» password|body|string| 是 |密码|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 查询是否已被注册

GET /account/register/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|username|query|string| 否 |用户名|
|contact|query|string| 否 |邮箱/手机号|

> 返回示例

> 成功

```json
{
  "msg": "用户名可使用"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 用户管理/用户信息查询修改

## GET 用户信息查询

GET /account/userinfo/{id}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|

> 返回示例

> 成功

```json
{
  "id": 1,
  "username": "admin",
  "email": "1554382111@qq.com",
  "phone": "16609376866",
  "sex": "1",
  "sex_name": "男",
  "web": null,
  "signature": "这个人很懒，什么都没留下！",
  "photo": "https://oss.cuiliangblog.cn/photo/default.jpg",
  "is_flow": true,
  "area_name": null,
  "area_code": null,
  "birthday": null,
  "source": "直接注册"
}
```

```json
{
  "id": 6,
  "username": "adc",
  "email": "cuiliang0302@qq.com",
  "phone": "17793666696",
  "sex": "1",
  "sex_name": "男",
  "web": "http://www.qq.com",
  "signature": "这就是个人简介哦",
  "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
  "is_flow": false,
  "area_name": "黑龙江省双鸭山市",
  "area_code": "230500",
  "birthday": "1980-01-15",
  "source": "直接注册"
}
```

```json
{
  "id": 6,
  "username": "adc",
  "email": "cuiliang0302@qq.com",
  "phone": "17793666696",
  "sex": "1",
  "sex_name": "男",
  "web": "http://www.baidu.com",
  "signature": "这就是个人简介",
  "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
  "is_flow": false,
  "area_name": "",
  "area_code": "",
  "birthday": null,
  "source": "直接注册"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## PUT 修改用户信息

PUT /account/userinfo/{id}/

> Body 请求参数

```yaml
username: adc
sex: "1"
web: http://www.baidu.com
signature: 这就是个人简介
area_name: string
area_code: string
birthday: string
is_flow: "false"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|
|body|body|object| 否 |none|
|» username|body|string| 否 |用户名|
|» sex|body|string| 否 |性别|
|» web|body|string| 否 |个人站点|
|» signature|body|string| 否 |个性简介|
|» area_name|body|string| 否 |地区名称|
|» area_code|body|string| 否 |地区编码|
|» birthday|body|string| 否 |生日|
|» is_flow|body|string| 否 |开启订阅|

> 返回示例

> 成功

```json
{
  "id": 6,
  "username": "adc",
  "email": "cuiliang0302@qq.com",
  "phone": "17793666696",
  "sex": "1",
  "sex_name": "男",
  "web": "http://www.baidu.com",
  "signature": "这就是个人简介",
  "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
  "is_flow": false,
  "area_name": "",
  "area_code": "",
  "birthday": null,
  "source": "直接注册"
}
```

```json
{
  "id": 6,
  "username": "adc",
  "email": "cuiliang0302@qq.com",
  "phone": "17793666696",
  "sex": "1",
  "sex_name": "男",
  "web": "http://www.baidu.com",
  "signature": "这就是个人简介",
  "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
  "is_flow": false,
  "area_name": "",
  "area_code": "",
  "birthday": null,
  "source": "直接注册"
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## PUT 修改用户邮箱

PUT /account/changeEmail/{id}/

> Body 请求参数

```yaml
password: 1234qwer
newEmail: 1750113075@qq.com
code: "123321"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|
|body|body|object| 否 |none|
|» password|body|string| 是 |密码|
|» newEmail|body|string| 是 |新邮箱|
|» code|body|string| 是 |验证码|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 用户管理/验证码

## POST 获取验证码

POST /account/code/

> Body 请求参数

```yaml
contact: cuiliang0302@qq.com
action: 用户注册
username: test

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» contact|body|string| 是 |联系方式（邮箱或手机）|
|» action|body|string| 是 |操作内容|
|» username|body|string| 否 |用户名|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 用户管理/密码设置

## PUT 修改密码

PUT /account/changePassword/{id}/

> Body 请求参数

```yaml
oldPassword: 123321qwer
newPassword: 1234qwer

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |用户ID|
|body|body|object| 否 |none|
|» oldPassword|body|string| 否 |旧密码|
|» newPassword|body|string| 否 |新密码|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## POST 重置密码

POST /account/setPassword/

> Body 请求参数

```yaml
contact: cuiliang0302@qq.com
code: "123456"
password: 123321qwer

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» contact|body|string| 否 |联系方式|
|» code|body|string| 否 |验证码|
|» password|body|string| 否 |新密码|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 行为记录/搜索

## GET 获取用户搜索记录

GET /record/searchHistory/{user_id}/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|user_id|path|string| 是 |用户ID|

> 返回示例

> 成功

```json
{
  "keys": [
    "面试",
    "docker",
    "阿里云",
    "k8s",
    "DRF",
    "grafana",
    "elk"
  ],
  "search": [
    1,
    5,
    6,
    9,
    10,
    11,
    12
  ]
}
```

```json
{
  "keys": [
    "面试",
    "docker",
    "阿里云",
    "k8s",
    "DRF",
    "grafana",
    "elk"
  ],
  "search": [
    1,
    5,
    6,
    9,
    10,
    11,
    12
  ]
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 搜索文章

GET /record/search/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|key|query|string| 是 |搜索关键词|
|user_id|query|string| 否 |用户ID|
|kind|query|string| 是 |搜索article还是note|
|order|query|string| 是 |default排序或view排序|

> 返回示例

> 成功

```json
[
  {
    "id": 30,
    "category": "Prometheus",
    "category_id": 10,
    "title": "thanos高可用prometheus集群部署",
    "abstract": "众所周知，prometheus默认是单机部署，不知道分布式水平扩展，当集群规模过大时，存在性能瓶颈。而thanos无疑是解决prometheus单机节点的最好解决方案。本文使用最新的thanos 0.23.0版本部署，实现prometheus的集群和高可用。",
    "cover": "https://oss.cuiliangblog.cn/articleCover/thanos%E9%83%A8%E7%BD%B2.png",
    "view": 942,
    "like": 3,
    "collect": 0,
    "comment": 0,
    "created_time": "2021-09-13T10:41:19.724902+08:00",
    "modified_time": "2022-04-05T00:27:49.270386+08:00",
    "is_recommend": true,
    "is_release": true,
    "author": 1,
    "tags": [
      6,
      9
    ]
  },
  {
    "id": 2,
    "category": "其他",
    "category_id": 8,
    "title": "运维工程师面试总结(含答案)",
    "abstract": "接着上篇提到的面试题目，随后又总结并整理相关答案内容，便于大家充分了解目前主流面试方向，希望可以帮到大家顺利找到称心满意的工作！",
    "cover": "https://oss.cuiliangblog.cn/articleCover/2020_11_28_21_35_59_870937.jpg",
    "view": 3791,
    "like": 13,
    "collect": 0,
    "comment": 0,
    "created_time": "2020-12-12T00:36:19.545564+08:00",
    "modified_time": "2022-04-04T13:27:54.110412+08:00",
    "is_recommend": true,
    "is_release": true,
    "author": 1,
    "tags": [
      1,
      9
    ]
  },
  {
    "id": 1,
    "category": "其他",
    "category_id": 8,
    "title": "linux运维工程师面试题总结",
    "abstract": "本人花费为期一周的时间，参加了数十家互联网公司的面试，主要方向是linux、容器运维、自动化运维，其中包括IBM、新浪、完美世界等公司。以下是本人参加面试时遇到的考题，希望可以帮助到大家！",
    "cover": "https://oss.cuiliangblog.cn/articleCover/2020_12_11_20_32_48_685428.jpg",
    "view": 2297,
    "like": 20,
    "collect": 0,
    "comment": 0,
    "created_time": "2020-11-08T19:37:41.588291+08:00",
    "modified_time": "2022-04-02T14:36:59.907601+08:00",
    "is_recommend": true,
    "is_release": true,
    "author": 1,
    "tags": [
      5,
      9
    ]
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 获取搜索热词

GET /record/searchHot/

> 返回示例

> 成功

```json
[
  "docker",
  "k8s",
  "面试",
  "爬虫",
  "DRF",
  "vue3",
  "coding",
  "阿里云",
  "mysql",
  "prometheus",
  "elk",
  "react",
  "grafana",
  "总结",
  "暗黑",
  "traefik",
  "运维工程师面试",
  "element-plus",
  "consul",
  "nginx",
  "ansible",
  "alpine",
  "自动化",
  "百度统计",
  "递归",
  "jenkins",
  "ceph",
  "python",
  "集群组件",
  "linux",
  "centos8",
  "123",
  "1111",
  "1",
  "第三方"
]
```

```json
[
  "docker",
  "k8s",
  "面试",
  "爬虫",
  "DRF",
  "vue3",
  "coding",
  "阿里云",
  "mysql",
  "prometheus",
  "elk",
  "react",
  "grafana",
  "总结",
  "暗黑",
  "traefik",
  "运维工程师面试",
  "element-plus",
  "consul",
  "nginx",
  "ansible",
  "alpine",
  "自动化",
  "百度统计",
  "递归",
  "jenkins",
  "ceph",
  "python",
  "集群组件",
  "linux",
  "centos8",
  "123",
  "1111",
  "1",
  "第三方"
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 行为记录/留言回复记录

## GET 获取留言列表

GET /record/leaveMessage/

> 返回示例

> 成功

```json
[
  {
    "id": 25,
    "username": "adc",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
    "child": [],
    "father_name": null,
    "content": "<p><img src=\"https://oss.cuiliangblog.cn/comment/1626075244145yXFb8aFz-1641634172934.jpeg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p>麻溜的</p>",
    "time": "2022-01-08T17:29:42.633081+08:00",
    "like": 0,
    "user": 6,
    "father": null
  },
  {
    "id": 19,
    "username": "张三",
    "photo": "https://oss.cuiliangblog.cn/images/photo.jpg",
    "child": [],
    "father_name": null,
    "content": "🤙🤙🤙",
    "time": "2021-06-24T21:47:21.889546+08:00",
    "like": 3,
    "user": 8,
    "father": null
  },
  {
    "id": 2,
    "username": "adc",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
    "child": [
      {
        "id": 4,
        "username": "admin",
        "photo": "https://oss.cuiliangblog.cn/photo/default.jpg",
        "child": [
          {
            "id": 16,
            "username": "adc",
            "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
            "child": [],
            "father_name": "admin",
            "content": "哈哈",
            "time": "2021-06-13T19:56:07.879776+08:00",
            "like": 2,
            "user": 6,
            "father": 4
          },
          {
            "id": 5,
            "username": "adc",
            "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
            "child": [],
            "father_name": "admin",
            "content": "一定一定！",
            "time": "2021-06-07T19:19:12.982513+08:00",
            "like": 3,
            "user": 6,
            "father": 4
          }
        ],
        "father_name": "adc",
        "content": "热烈欢迎，有空多来看看",
        "time": "2021-05-08T19:16:48.109961+08:00",
        "like": 5,
        "user": 1,
        "father": 2
      }
    ],
    "father_name": null,
    "content": "good good study，day day up",
    "time": "2021-04-03T19:14:46.267388+08:00",
    "like": 7,
    "user": 6,
    "father": null
  },
  {
    "id": 1,
    "username": "南城阿宇",
    "photo": "https://oss.cuiliangblog.cn/photo/2020_12_26_18_08_54_811414_M52cgvE.jpg",
    "child": [
      {
        "id": 3,
        "username": "admin",
        "photo": "https://oss.cuiliangblog.cn/photo/default.jpg",
        "child": [],
        "father_name": "南城阿宇",
        "content": "欢迎欢迎",
        "time": "2021-05-01T19:16:13.131192+08:00",
        "like": 2,
        "user": 1,
        "father": 1
      }
    ],
    "father_name": null,
    "content": "我过来看看",
    "time": "2021-03-02T19:13:51.456670+08:00",
    "like": 11,
    "user": 2,
    "father": null
  }
]
```

```json
[
  {
    "id": 25,
    "username": "adc",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
    "child": [],
    "father_name": null,
    "content": "<p><img src=\"https://oss.cuiliangblog.cn/comment/1626075244145yXFb8aFz-1641634172934.jpeg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p>麻溜的</p>",
    "time": "2022-01-08T17:29:42.633081+08:00",
    "like": 0,
    "user": 6,
    "father": null
  },
  {
    "id": 19,
    "username": "张三",
    "photo": "https://oss.cuiliangblog.cn/images/photo.jpg",
    "child": [],
    "father_name": null,
    "content": "🤙🤙🤙",
    "time": "2021-06-24T21:47:21.889546+08:00",
    "like": 3,
    "user": 8,
    "father": null
  },
  {
    "id": 2,
    "username": "adc",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
    "child": [
      {
        "id": 4,
        "username": "admin",
        "photo": "https://oss.cuiliangblog.cn/photo/default.jpg",
        "child": [
          {
            "id": 16,
            "username": "adc",
            "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
            "child": [],
            "father_name": "admin",
            "content": "哈哈",
            "time": "2021-06-13T19:56:07.879776+08:00",
            "like": 2,
            "user": 6,
            "father": 4
          },
          {
            "id": 5,
            "username": "adc",
            "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
            "child": [],
            "father_name": "admin",
            "content": "一定一定！",
            "time": "2021-06-07T19:19:12.982513+08:00",
            "like": 3,
            "user": 6,
            "father": 4
          }
        ],
        "father_name": "adc",
        "content": "热烈欢迎，有空多来看看",
        "time": "2021-05-08T19:16:48.109961+08:00",
        "like": 5,
        "user": 1,
        "father": 2
      }
    ],
    "father_name": null,
    "content": "good good study，day day up",
    "time": "2021-04-03T19:14:46.267388+08:00",
    "like": 7,
    "user": 6,
    "father": null
  },
  {
    "id": 1,
    "username": "南城阿宇",
    "photo": "https://oss.cuiliangblog.cn/photo/2020_12_26_18_08_54_811414_M52cgvE.jpg",
    "child": [
      {
        "id": 3,
        "username": "admin",
        "photo": "https://oss.cuiliangblog.cn/photo/default.jpg",
        "child": [],
        "father_name": "南城阿宇",
        "content": "欢迎欢迎",
        "time": "2021-05-01T19:16:13.131192+08:00",
        "like": 2,
        "user": 1,
        "father": 1
      }
    ],
    "father_name": null,
    "content": "我过来看看",
    "time": "2021-03-02T19:13:51.456670+08:00",
    "like": 11,
    "user": 2,
    "father": null
  }
]
```

```json
[
  {
    "id": 25,
    "username": "adc",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
    "child": [],
    "father_name": null,
    "content": "<p><img src=\"https://oss.cuiliangblog.cn/comment/1626075244145yXFb8aFz-1641634172934.jpeg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p>麻溜的</p>",
    "time": "2022-01-08T17:29:42.633081+08:00",
    "like": 0,
    "user": 6,
    "father": null
  },
  {
    "id": 19,
    "username": "张三",
    "photo": "https://oss.cuiliangblog.cn/images/photo.jpg",
    "child": [],
    "father_name": null,
    "content": "🤙🤙🤙",
    "time": "2021-06-24T21:47:21.889546+08:00",
    "like": 3,
    "user": 8,
    "father": null
  },
  {
    "id": 2,
    "username": "adc",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
    "child": [
      {
        "id": 4,
        "username": "admin",
        "photo": "https://oss.cuiliangblog.cn/photo/default.jpg",
        "child": [
          {
            "id": 16,
            "username": "adc",
            "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
            "child": [],
            "father_name": "admin",
            "content": "哈哈",
            "time": "2021-06-13T19:56:07.879776+08:00",
            "like": 2,
            "user": 6,
            "father": 4
          },
          {
            "id": 5,
            "username": "adc",
            "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
            "child": [],
            "father_name": "admin",
            "content": "一定一定！",
            "time": "2021-06-07T19:19:12.982513+08:00",
            "like": 3,
            "user": 6,
            "father": 4
          }
        ],
        "father_name": "adc",
        "content": "热烈欢迎，有空多来看看",
        "time": "2021-05-08T19:16:48.109961+08:00",
        "like": 5,
        "user": 1,
        "father": 2
      }
    ],
    "father_name": null,
    "content": "good good study，day day up",
    "time": "2021-04-03T19:14:46.267388+08:00",
    "like": 7,
    "user": 6,
    "father": null
  },
  {
    "id": 1,
    "username": "南城阿宇",
    "photo": "https://oss.cuiliangblog.cn/photo/2020_12_26_18_08_54_811414_M52cgvE.jpg",
    "child": [
      {
        "id": 3,
        "username": "admin",
        "photo": "https://oss.cuiliangblog.cn/photo/default.jpg",
        "child": [],
        "father_name": "南城阿宇",
        "content": "欢迎欢迎",
        "time": "2021-05-01T19:16:13.131192+08:00",
        "like": 2,
        "user": 1,
        "father": 1
      }
    ],
    "father_name": null,
    "content": "我过来看看",
    "time": "2021-03-02T19:13:51.456670+08:00",
    "like": 11,
    "user": 2,
    "father": null
  }
]
```

```json
[
  {
    "id": 25,
    "username": "adc",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
    "child": [],
    "father_name": null,
    "content": "<p><img src=\"https://oss.cuiliangblog.cn/comment/1626075244145yXFb8aFz-1641634172934.jpeg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p>麻溜的</p>",
    "time": "2022-01-08T17:29:42.633081+08:00",
    "like": 0,
    "user": 6,
    "father": null
  },
  {
    "id": 19,
    "username": "张三",
    "photo": "https://oss.cuiliangblog.cn/images/photo.jpg",
    "child": [],
    "father_name": null,
    "content": "🤙🤙🤙",
    "time": "2021-06-24T21:47:21.889546+08:00",
    "like": 3,
    "user": 8,
    "father": null
  },
  {
    "id": 2,
    "username": "adc",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
    "child": [
      {
        "id": 4,
        "username": "admin",
        "photo": "https://oss.cuiliangblog.cn/photo/default.jpg",
        "child": [
          {
            "id": 16,
            "username": "adc",
            "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
            "child": [],
            "father_name": "admin",
            "content": "哈哈",
            "time": "2021-06-13T19:56:07.879776+08:00",
            "like": 2,
            "user": 6,
            "father": 4
          },
          {
            "id": 5,
            "username": "adc",
            "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
            "child": [],
            "father_name": "admin",
            "content": "一定一定！",
            "time": "2021-06-07T19:19:12.982513+08:00",
            "like": 3,
            "user": 6,
            "father": 4
          }
        ],
        "father_name": "adc",
        "content": "热烈欢迎，有空多来看看",
        "time": "2021-05-08T19:16:48.109961+08:00",
        "like": 5,
        "user": 1,
        "father": 2
      }
    ],
    "father_name": null,
    "content": "good good study，day day up",
    "time": "2021-04-03T19:14:46.267388+08:00",
    "like": 7,
    "user": 6,
    "father": null
  },
  {
    "id": 1,
    "username": "南城阿宇",
    "photo": "https://oss.cuiliangblog.cn/photo/2020_12_26_18_08_54_811414_M52cgvE.jpg",
    "child": [
      {
        "id": 3,
        "username": "admin",
        "photo": "https://oss.cuiliangblog.cn/photo/default.jpg",
        "child": [],
        "father_name": "南城阿宇",
        "content": "欢迎欢迎",
        "time": "2021-05-01T19:16:13.131192+08:00",
        "like": 2,
        "user": 1,
        "father": 1
      }
    ],
    "father_name": null,
    "content": "我过来看看",
    "time": "2021-03-02T19:13:51.456670+08:00",
    "like": 11,
    "user": 2,
    "father": null
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## POST 回复留言

POST /record/leaveMessage/

> Body 请求参数

```yaml
content: 测试回复
user: "1"
father: "6"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» content|body|string| 是 |留言内容|
|» user|body|string| 是 |用户ID|
|» father|body|string| 是 |回复留言ID|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## DELETE 删除单个留言

DELETE /record/leaveMessage/{id}/

> Body 请求参数

```yaml
{}

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |留言ID|
|body|body|object| 否 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 获取单个留言

GET /record/leaveMessage/{id}/

> Body 请求参数

```yaml
{}

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |留言ID|
|body|body|object| 否 |none|

> 返回示例

> 成功

```json
{
  "id": 25,
  "username": "adc",
  "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
  "child": [],
  "father_name": null,
  "content": "<p><img src=\"https://oss.cuiliangblog.cn/comment/1626075244145yXFb8aFz-1641634172934.jpeg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p>麻溜的</p>",
  "time": "2022-01-08T17:29:42.633081+08:00",
  "like": 3,
  "user": 6,
  "father": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## PATCH 留言点赞

PATCH /record/leaveMessage/{id}/

> Body 请求参数

```yaml
like: "3"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|
|body|body|object| 否 |none|
|» like|body|string| 是 |none|

> 返回示例

> 成功

```json
{
  "id": 25,
  "username": "adc",
  "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
  "child": [],
  "father_name": null,
  "content": "<p><img src=\"https://oss.cuiliangblog.cn/comment/1626075244145yXFb8aFz-1641634172934.jpeg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p>麻溜的</p>",
  "time": "2022-01-08T17:29:42.633081+08:00",
  "like": 3,
  "user": 6,
  "father": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 行为记录/文章评论回复记录

## PATCH 评论点赞

PATCH /record/articleComment/{id}/

> Body 请求参数

```yaml
like: "3"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|
|body|body|object| 否 |none|
|» like|body|string| 是 |none|

> 返回示例

> 成功

```json
{
  "id": 16,
  "article": "DRF递归序列化器与VUE递归组件",
  "article_id": 23,
  "username": "adc",
  "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
  "child": [],
  "father_name": "张三",
  "content": "对的",
  "time": "2021-10-06T13:27:59.619342+08:00",
  "like": 3,
  "user": 6,
  "father": 14
}
```

```json
{
  "id": 16,
  "article": "DRF递归序列化器与VUE递归组件",
  "article_id": 23,
  "username": "adc",
  "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
  "child": [],
  "father_name": "张三",
  "content": "对的",
  "time": "2021-10-06T13:27:59.619342+08:00",
  "like": 3,
  "user": 6,
  "father": 14
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## DELETE 删除单个评论

DELETE /record/articleComment/{id}/

> Body 请求参数

```yaml
{}

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |留言ID|
|body|body|object| 否 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 获取文章评论回复列表

GET /record/articleComment/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|article|query|string| 是 |文章ID|

> 返回示例

> 成功

```json
[
  {
    "id": 14,
    "article": "DRF递归序列化器与VUE递归组件",
    "article_id": 23,
    "username": "张三",
    "photo": "https://oss.cuiliangblog.cn/images/photo.jpg",
    "child": [
      {
        "id": 16,
        "article": "DRF递归序列化器与VUE递归组件",
        "article_id": 23,
        "username": "adc",
        "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
        "child": [],
        "father_name": "张三",
        "content": "对的",
        "time": "2021-10-06T13:27:59.619342+08:00",
        "like": 0,
        "user": 6,
        "father": 14
      }
    ],
    "father_name": null,
    "content": "🤙🤙🤙",
    "time": "2021-06-24T21:47:52.949577+08:00",
    "like": 1,
    "user": 8,
    "father": null
  },
  {
    "id": 3,
    "article": "DRF递归序列化器与VUE递归组件",
    "article_id": 23,
    "username": "蕉太狼",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_02_16_10_20_00_725112_OJZHQ4a.jpg",
    "child": [],
    "father_name": null,
    "content": "写得好！",
    "time": "2021-06-13T08:46:37.466325+08:00",
    "like": 3,
    "user": 4,
    "father": null
  },
  {
    "id": 1,
    "article": "DRF递归序列化器与VUE递归组件",
    "article_id": 23,
    "username": "南城阿宇",
    "photo": "https://oss.cuiliangblog.cn/photo/2020_12_26_18_08_54_811414_M52cgvE.jpg",
    "child": [
      {
        "id": 2,
        "article": "DRF递归序列化器与VUE递归组件",
        "article_id": 23,
        "username": "admin",
        "photo": "https://oss.cuiliangblog.cn/photo/default.jpg",
        "child": [],
        "father_name": "南城阿宇",
        "content": "感谢支持",
        "time": "2021-06-12T22:10:02.528198+08:00",
        "like": 0,
        "user": 1,
        "father": 1
      }
    ],
    "father_name": null,
    "content": "写的不错，受教了！",
    "time": "2021-06-12T22:08:16.272123+08:00",
    "like": 0,
    "user": 2,
    "father": null
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## POST 发表评论

POST /record/articleComment/

> Body 请求参数

```yaml
content: 测试留言
user: "6"
article_id: "23"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» content|body|string| 是 |留言内容|
|» user|body|string| 是 |用户ID|
|» article_id|body|string| 是 |文章ID|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 行为记录/笔记评论回复记录

## POST 回复评论

POST /record/sectionComment/

> Body 请求参数

```yaml
content: 测试回复
user: "1"
father: "4"
section: "1"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» content|body|string| 是 |留言内容|
|» user|body|string| 是 |用户ID|
|» father|body|string| 是 |回复留言ID|
|» section|body|string| 是 |文章ID|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 获取笔记评论回复列表

GET /record/sectionComment/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|section|query|string| 是 |笔记ID|

> 返回示例

> 成功

```json
[
  {
    "id": 14,
    "section": "Kubernetes特性",
    "section_id": 1,
    "username": "adc",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
    "child": [],
    "father_name": null,
    "content": "<p>😀<br/></p>",
    "time": "2022-01-08T21:36:39.091921+08:00",
    "like": 1,
    "user": 6,
    "father": null
  },
  {
    "id": 13,
    "section": "Kubernetes特性",
    "section_id": 1,
    "username": "adc",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
    "child": [],
    "father_name": null,
    "content": "<p><img src=\"https://oss.cuiliangblog.cn/comment/1626075244145yXFb8aFz-1641648885543.jpeg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>",
    "time": "2022-01-08T21:34:56.372394+08:00",
    "like": 1,
    "user": 6,
    "father": null
  },
  {
    "id": 11,
    "section": "Kubernetes特性",
    "section_id": 1,
    "username": "张三",
    "photo": "https://oss.cuiliangblog.cn/images/photo.jpg",
    "child": [],
    "father_name": null,
    "content": "🤙🤙🤙",
    "time": "2021-06-24T21:48:26.021707+08:00",
    "like": 1,
    "user": 8,
    "father": null
  },
  {
    "id": 2,
    "section": "Kubernetes特性",
    "section_id": 1,
    "username": "蕉太狼",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_02_16_10_20_00_725112_OJZHQ4a.jpg",
    "child": [],
    "father_name": null,
    "content": "总结的很到位",
    "time": "2021-06-13T20:45:46.079482+08:00",
    "like": 1,
    "user": 4,
    "father": null
  },
  {
    "id": 1,
    "section": "Kubernetes特性",
    "section_id": 1,
    "username": "张三",
    "photo": "https://oss.cuiliangblog.cn/images/photo.jpg",
    "child": [
      {
        "id": 3,
        "section": "Kubernetes特性",
        "section_id": 1,
        "username": "admin",
        "photo": "https://oss.cuiliangblog.cn/photo/default.jpg",
        "child": [],
        "father_name": "张三",
        "content": "谢谢！",
        "time": "2021-06-13T20:46:07.546247+08:00",
        "like": 1,
        "user": 1,
        "father": 1
      }
    ],
    "father_name": null,
    "content": "get到了",
    "time": "2021-06-13T20:45:22.652724+08:00",
    "like": 1,
    "user": 8,
    "father": null
  }
]
```

```json
[
  {
    "id": 14,
    "section": "Kubernetes特性",
    "section_id": 1,
    "username": "adc",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
    "child": [],
    "father_name": null,
    "content": "<p>😀<br/></p>",
    "time": "2022-01-08T21:36:39.091921+08:00",
    "like": 1,
    "user": 6,
    "father": null
  },
  {
    "id": 13,
    "section": "Kubernetes特性",
    "section_id": 1,
    "username": "adc",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
    "child": [],
    "father_name": null,
    "content": "<p><img src=\"https://oss.cuiliangblog.cn/comment/1626075244145yXFb8aFz-1641648885543.jpeg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>",
    "time": "2022-01-08T21:34:56.372394+08:00",
    "like": 1,
    "user": 6,
    "father": null
  },
  {
    "id": 11,
    "section": "Kubernetes特性",
    "section_id": 1,
    "username": "张三",
    "photo": "https://oss.cuiliangblog.cn/images/photo.jpg",
    "child": [],
    "father_name": null,
    "content": "🤙🤙🤙",
    "time": "2021-06-24T21:48:26.021707+08:00",
    "like": 1,
    "user": 8,
    "father": null
  },
  {
    "id": 2,
    "section": "Kubernetes特性",
    "section_id": 1,
    "username": "蕉太狼",
    "photo": "https://oss.cuiliangblog.cn/photo/2021_02_16_10_20_00_725112_OJZHQ4a.jpg",
    "child": [],
    "father_name": null,
    "content": "总结的很到位",
    "time": "2021-06-13T20:45:46.079482+08:00",
    "like": 1,
    "user": 4,
    "father": null
  },
  {
    "id": 1,
    "section": "Kubernetes特性",
    "section_id": 1,
    "username": "张三",
    "photo": "https://oss.cuiliangblog.cn/images/photo.jpg",
    "child": [
      {
        "id": 3,
        "section": "Kubernetes特性",
        "section_id": 1,
        "username": "admin",
        "photo": "https://oss.cuiliangblog.cn/photo/default.jpg",
        "child": [],
        "father_name": "张三",
        "content": "谢谢！",
        "time": "2021-06-13T20:46:07.546247+08:00",
        "like": 1,
        "user": 1,
        "father": 1
      }
    ],
    "father_name": null,
    "content": "get到了",
    "time": "2021-06-13T20:45:22.652724+08:00",
    "like": 1,
    "user": 8,
    "father": null
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## PATCH 评论点赞

PATCH /record/sectionComment/{id}/

> Body 请求参数

```yaml
like: "3"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |none|
|body|body|object| 否 |none|
|» like|body|string| 是 |none|

> 返回示例

> 成功

```json
{
  "id": 14,
  "section": "Kubernetes特性",
  "section_id": 1,
  "username": "adc",
  "photo": "https://oss.cuiliangblog.cn/photo/2021_6_4_12_24_24-1622780664642.jpg",
  "child": [],
  "father_name": null,
  "content": "<p>😀<br/></p>",
  "time": "2022-01-08T21:36:39.091921+08:00",
  "like": 3,
  "user": 6,
  "father": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## DELETE 删除单个评论

DELETE /record/sectionComment/{id}/

> Body 请求参数

```yaml
{}

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|string| 是 |留言ID|
|body|body|object| 否 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 行为记录/文章浏览记录

## PUT 文章添加收藏

PUT /record/articleHistory/

> Body 请求参数

```yaml
article_id: "23"
user: "6"
is_collect: "1"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» article_id|body|string| 是 |文章ID|
|» user|body|string| 是 |用户ID|
|» is_collect|body|string| 是 |是否收藏|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## POST 添加文章浏览记录

POST /record/articleHistory/

> Body 请求参数

```yaml
article_id: "23"
user: "6"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» article_id|body|string| 是 |文章ID|
|» user|body|string| 是 |用户ID|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 获取指定文章浏览详情

GET /record/articleHistory/

> Body 请求参数

```yaml
{}

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|article|query|string| 是 |文章ID|
|user|query|string| 是 |用户ID|
|body|body|object| 否 |none|

> 返回示例

> 成功

```json
{
  "id": 18,
  "article": "DRF递归序列化器与VUE递归组件",
  "article_id": 23,
  "time": "2021-06-24T21:55:54.883574+08:00",
  "is_collect": false,
  "user": 8
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 行为记录/笔记浏览记录

## POST 添加笔记浏览记录

POST /record/sectionHistory/

> Body 请求参数

```yaml
section: "2"
user: "3"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» section|body|string| 是 |笔记ID|
|» user|body|string| 是 |用户ID|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 获取用户所有笔记浏览记录

GET /record/sectionHistory/

> Body 请求参数

```yaml
{}

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|user|query|string| 是 |用户ID|
|body|body|object| 否 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## PUT 笔记添加收藏

PUT /record/sectionHistory/

> Body 请求参数

```yaml
section: "2"
user: "3"
is_collect: "1"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» section|body|string| 是 |笔记ID|
|» user|body|string| 是 |用户ID|
|» is_collect|body|string| 是 |是否收藏|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 行为记录/数据统计

## GET 用户数据统计

GET /record/statistics/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|user|query|string| 是 |用户ID|

> 返回示例

> 成功

```json
{
  "article_history": 29,
  "article_collect": 8,
  "article_comment": 5,
  "section_history": 18,
  "section_collect": 5,
  "section_comment": 4
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 行为记录/数据统计/获取用户echarts数据

## GET 用户echarts数据-浏览文章

GET /record/userEcharts/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|chart|query|string| 是 |图表名称|
|user|query|string| 是 |用户ID|

> 返回示例

> 成功

```json
[
  {
    "value": 3,
    "name": "Linux"
  },
  {
    "value": 1,
    "name": "MySQL"
  },
  {
    "value": 4,
    "name": "Python"
  },
  {
    "value": 6,
    "name": "Django"
  },
  {
    "value": 1,
    "name": "Docker"
  },
  {
    "value": 3,
    "name": "Kubernetes"
  },
  {
    "value": 0,
    "name": "CI/CD"
  },
  {
    "value": 2,
    "name": "其他"
  },
  {
    "value": 5,
    "name": "前端"
  },
  {
    "value": 4,
    "name": "Prometheus"
  }
]
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 公共接口

## GET 获取背景图片地址

GET /public/backgroundImage/

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 获取七牛上传文件token

GET /public/qiniuToken/

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 图片防盗链代理

GET /public/imgProxy/

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|url|query|string| 否 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## GET 获取省市县编号

GET /public/areaData/

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

## POST CDN资源刷新接口

POST /public/cdnRefresh/

> Body 请求参数

```yaml
url: https://www.cuiliangblog.cn/

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» url|body|string| 是 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 第三方接口

## GET 必应壁纸

GET /HPImageArchive.aspx

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|format|query|string| 否 |none|
|idx|query|string| 否 |none|
|n|query|string| 否 |none|
|mkt|query|string| 否 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 第三方接口/微博

## POST OAuth2的access_token接口

POST /oauth2/access_token

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|client_id|query|string| 否 |none|
|client_secret|query|string| 否 |none|
|grant_type|query|string| 否 |none|
|code|query|string| 否 |none|
|redirect_uri|query|string| 否 |none|

> 返回示例

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|成功|Inline|

### 返回数据结构

# 数据模型

<h2 id="tocS_Catalogue">Catalogue</h2>

<a id="schemacatalogue"></a>
<a id="schema_Catalogue"></a>
<a id="tocScatalogue"></a>
<a id="tocscatalogue"></a>

```json
{
  "note_id": "string",
  "name": "string",
  "order": "string",
  "level": "string",
  "father": "string",
  "section_id": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|note_id|string|true|none|笔记名称|
|name|string|true|none|章节标题|
|order|string|true|none|序号|
|level|string|true|none|层级|
|father|string|true|none|父目录ID|
|section_id|string|true|none|笔记标题|

<h2 id="tocS_SiteConfig">SiteConfig</h2>

<a id="schemasiteconfig"></a>
<a id="schema_SiteConfig"></a>
<a id="tocSsiteconfig"></a>
<a id="tocssiteconfig"></a>

```json
{
  "name": "string",
  "domain": "string",
  "index_title": "string",
  "keyword": "string",
  "describe": "string",
  "copyright": "string",
  "logo": "string",
  "logo_full": "string",
  "icon": "string",
  "photo": "string",
  "cover": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|name|string|true|none|网站名称|
|domain|string|true|none|网站域名|
|index_title|string|true|none|首页标题|
|keyword|string|true|none|META关键词|
|describe|string|true|none|META描述信息|
|copyright|string|true|none|版权信息|
|logo|string|true|none|Logo地址|
|logo_full|string|true|none|完整logo|
|icon|string|true|none|icon图标|
|photo|string|true|none|默认头像|
|cover|string|true|none|默认封面|

<h2 id="tocS_Tag">Tag</h2>

<a id="schematag"></a>
<a id="schema_Tag"></a>
<a id="tocStag"></a>
<a id="tocstag"></a>

```json
{
  "name": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|name|string|true|none|none|

<h2 id="tocS_Info">Info</h2>

<a id="schemainfo"></a>
<a id="schema_Info"></a>
<a id="tocSinfo"></a>
<a id="tocsinfo"></a>

```json
{
  "position": "string",
  "company": "string",
  "location": "string",
  "email": "string",
  "gitee": "string",
  "github": "string",
  "qq": "string",
  "weixin": "string",
  "pay": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|position|string|true|none|职位|
|company|string|true|none|公司|
|location|string|true|none|地址|
|email|string|true|none|邮箱地址|
|gitee|string|true|none|码云地址|
|github|string|true|none|github地址|
|qq|string|true|none|qq二维码|
|weixin|string|true|none|微信二维码|
|pay|string|true|none|赞赏码|

<h2 id="tocS_Link">Link</h2>

<a id="schemalink"></a>
<a id="schema_Link"></a>
<a id="tocSlink"></a>
<a id="tocslink"></a>

```json
{
  "logo": "string",
  "name": "string",
  "url": "string",
  "describe": "string",
  "type": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|logo|string|true|none|网站图标|
|name|string|true|none|网站名称|
|url|string|true|none|网站地址|
|describe|string|true|none|网站描述|
|type|string|true|none|类型|

<h2 id="tocS_SearchHistory">SearchHistory</h2>

<a id="schemasearchhistory"></a>
<a id="schema_SearchHistory"></a>
<a id="tocSsearchhistory"></a>
<a id="tocssearchhistory"></a>

```json
{
  "key": "string",
  "time": "string",
  "user_id": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|key|string|true|none|none|
|time|string|true|none|none|
|user_id|string|true|none|none|

<h2 id="tocS_UploadImg">UploadImg</h2>

<a id="schemauploadimg"></a>
<a id="schema_UploadImg"></a>
<a id="tocSuploadimg"></a>
<a id="tocsuploadimg"></a>

```json
{
  "images": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|images|string|true|none|none|

<h2 id="tocS_ArticleComment">ArticleComment</h2>

<a id="schemaarticlecomment"></a>
<a id="schema_ArticleComment"></a>
<a id="tocSarticlecomment"></a>
<a id="tocsarticlecomment"></a>

```json
{
  "article_id": "string",
  "content": "string",
  "user_id": "string",
  "level": "string",
  "like": "string",
  "reply_id": "string",
  "root_id": "string",
  "time": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|article_id|string|true|none|文章ID|
|content|string|true|none|留言内容|
|user_id|string|true|none|用户|
|level|string|true|none|评论等级|
|like|string|true|none|评论点赞数|
|reply_id|string|true|none|回复评论ID|
|root_id|string|true|none|根评论ID|
|time|string|true|none|评论时间|

<h2 id="tocS_SearchHistory1">SearchHistory1</h2>

<a id="schemasearchhistory1"></a>
<a id="schema_SearchHistory1"></a>
<a id="tocSsearchhistory1"></a>
<a id="tocssearchhistory1"></a>

```json
{
  "user_id": "string",
  "time": "string",
  "keyword": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|user_id|string|true|none|用户ID|
|time|string|true|none|搜索时间|
|keyword|string|true|none|搜索词|

<h2 id="tocS_SectionComment">SectionComment</h2>

<a id="schemasectioncomment"></a>
<a id="schema_SectionComment"></a>
<a id="tocSsectioncomment"></a>
<a id="tocssectioncomment"></a>

```json
{
  "section_id": "string",
  "content": "string",
  "user_id": "string",
  "level": "string",
  "like": "string",
  "reply_id": "string",
  "root_id": "string",
  "time": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|section_id|string|true|none|笔记ID|
|content|string|true|none|留言内容|
|user_id|string|true|none|用户|
|level|string|true|none|留言等级|
|like|string|true|none|留言点赞数|
|reply_id|string|true|none|回复留言ID|
|root_id|string|true|none|根留言ID|
|time|string|true|none|留言时间|

<h2 id="tocS_Category">Category</h2>

<a id="schemacategory"></a>
<a id="schema_Category"></a>
<a id="tocScategory"></a>
<a id="tocscategory"></a>

```json
{
  "name": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|name|string|true|none|none|

<h2 id="tocS_UserInfo">UserInfo</h2>

<a id="schemauserinfo"></a>
<a id="schema_UserInfo"></a>
<a id="tocSuserinfo"></a>
<a id="tocsuserinfo"></a>

```json
{
  "phone": "string",
  "username": "string",
  "sex": "string",
  "web": "string",
  "signature": "string",
  "photo": "string",
  "is_flow": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|phone|string|true|none|none|
|username|string|true|none|none|
|sex|string|true|none|none|
|web|string|true|none|none|
|signature|string|true|none|none|
|photo|string|true|none|none|
|is_flow|string|true|none|none|

<h2 id="tocS_Article">Article</h2>

<a id="schemaarticle"></a>
<a id="schema_Article"></a>
<a id="tocSarticle"></a>
<a id="tocsarticle"></a>

```json
{
  "title": "string",
  "abstract": "string",
  "category_id": "string",
  "tag_id": "string",
  "cover": "string",
  "body": "string",
  "author_id": "string",
  "view": 0,
  "like": 0,
  "collect": 0,
  "comment": 0,
  "create_time": "string",
  "modified_time": "string",
  "is_release": true,
  "is_recommend": true
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|title|string|true|none|文章标题|
|abstract|string|true|none|文章摘要|
|category_id|string|true|none|分类ID|
|tag_id|string|true|none|标签ID|
|cover|string|true|none|文章封面|
|body|string|true|none|文章内容|
|author_id|string|true|none|作者ID|
|view|integer|true|none|阅读量|
|like|integer|true|none|点赞量|
|collect|integer|true|none|收藏量|
|comment|integer|true|none|评论量|
|create_time|string|true|none|发布时间|
|modified_time|string|true|none|修改时间|
|is_release|boolean|true|none|发布/暂存|
|is_recommend|boolean|true|none|是否推荐|

<h2 id="tocS_MessageHistory">MessageHistory</h2>

<a id="schemamessagehistory"></a>
<a id="schema_MessageHistory"></a>
<a id="tocSmessagehistory"></a>
<a id="tocsmessagehistory"></a>

```json
{
  "message_from": "string",
  "message_to": "string",
  "time": "string",
  "content": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|message_from|string|true|none|none|
|message_to|string|true|none|none|
|time|string|true|none|none|
|content|string|true|none|none|

<h2 id="tocS_SectionHistory">SectionHistory</h2>

<a id="schemasectionhistory"></a>
<a id="schema_SectionHistory"></a>
<a id="tocSsectionhistory"></a>
<a id="tocssectionhistory"></a>

```json
{
  "section_id": "string",
  "user_id": "string",
  "time": "string",
  "is_like": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|section_id|string|true|none|笔记ID|
|user_id|string|true|none|用户ID|
|time|string|true|none|浏览时间|
|is_like|string|true|none|是否收藏|

<h2 id="tocS_Section">Section</h2>

<a id="schemasection"></a>
<a id="schema_Section"></a>
<a id="tocSsection"></a>
<a id="tocssection"></a>

```json
{
  "title": "string",
  "note_id": "string",
  "body": "string",
  "author_id": "string",
  "view": "string",
  "like": "string",
  "collect": "string",
  "comment": "string",
  "created_time": "string",
  "modified_time": "string",
  "is_release": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|title|string|true|none|笔记标题|
|note_id|string|true|none|所属笔记|
|body|string|true|none|笔记内容|
|author_id|string|true|none|作者|
|view|string|true|none|阅读量|
|like|string|true|none|点赞数|
|collect|string|true|none|收藏数|
|comment|string|true|none|评论数|
|created_time|string|true|none|发布时间|
|modified_time|string|true|none|修改时间|
|is_release|string|true|none|是否发布|

<h2 id="tocS_ArticleHistory">ArticleHistory</h2>

<a id="schemaarticlehistory"></a>
<a id="schema_ArticleHistory"></a>
<a id="tocSarticlehistory"></a>
<a id="tocsarticlehistory"></a>

```json
{
  "article_id": "string",
  "user_id": "string",
  "time": "string",
  "is_like": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|article_id|string|true|none|文章ID|
|user_id|string|true|none|用户ID|
|time|string|true|none|浏览时间|
|is_like|string|true|none|是否收藏|

<h2 id="tocS_Note">Note</h2>

<a id="schemanote"></a>
<a id="schema_Note"></a>
<a id="tocSnote"></a>
<a id="tocsnote"></a>

```json
{
  "name": "string",
  "cover": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|name|string|true|none|none|
|cover|string|true|none|none|

<h2 id="tocS_about">about</h2>

<a id="schemaabout"></a>
<a id="schema_about"></a>
<a id="tocSabout"></a>
<a id="tocsabout"></a>

```json
{
  "title": "string",
  "body": "string",
  "time": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|title|string|true|none|none|
|body|string|true|none|none|
|time|string|true|none|none|

<h2 id="tocS_LeaveMessage">LeaveMessage</h2>

<a id="schemaleavemessage"></a>
<a id="schema_LeaveMessage"></a>
<a id="tocSleavemessage"></a>
<a id="tocsleavemessage"></a>

```json
{
  "content": "string",
  "user_id": "string",
  "level": "string",
  "like": "string",
  "reply_id": "string",
  "root_id": "string",
  "time": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|content|string|true|none|留言内容|
|user_id|string|true|none|用户|
|level|string|true|none|留言等级|
|like|string|true|none|留言点赞数|
|reply_id|string|true|none|回复留言ID|
|root_id|string|true|none|根留言ID|
|time|string|true|none|留言时间|

<h2 id="tocS_Carousel">Carousel</h2>

<a id="schemacarousel"></a>
<a id="schema_Carousel"></a>
<a id="tocScarousel"></a>
<a id="tocscarousel"></a>

```json
{
  "image": "string",
  "url": "string",
  "title": "string",
  "is_show": "string"
}

```

### 属性

|名称|类型|必选|约束|说明|
|---|---|---|---|---|
|image|string|true|none|图片地址|
|url|string|true|none|轮播链接|
|title|string|true|none|图片说明|
|is_show|string|true|none|是否显示|

