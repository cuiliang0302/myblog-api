# Django Simple UI 隐藏右侧版本信息和使用分析
SIMPLEUI_HOME_INFO = False
SIMPLEUI_ANALYSIS = False
# Django Simple UI 自定义logo
SIMPLEUI_LOGO = 'https://oss.cuiliangblog.cn/image/logo.png'
# 隐藏首页的快捷操作和最近动作
SIMPLEUI_HOME_QUICK = False
SIMPLEUI_HOME_ACTION = False

# 自定义admin首页
SIMPLEUI_HOME_PAGE = '/defined/#index/'
SIMPLEUI_HOME_TITLE = '系统主页'
SIMPLEUI_HOME_ICON = 'fa fa-home'
# 自定义菜单
SIMPLEUI_CONFIG = {
    'system_keep': True,
    'menu_display': ['内容管理', '用户管理', '网站管理', '行为记录', '其他工具', 'Django APScheduler'],
    'menus': [
        {
            'name': '其他工具',
            'icon': 'fas fa-wrench',
            'models': [
                {
                    'name': '目录编排',
                    'icon': 'fas fa-folder-open',
                    'url': '/defined/#/directory/'
                },
                {
                    'name': '图片裁剪',
                    'icon': 'fas fa-file-image',
                    'url': '/defined/#/image/'
                }
            ]
        }
    ]
}