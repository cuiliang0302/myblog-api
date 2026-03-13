import multiprocessing

bind = "0.0.0.0:8000"
backlog = 512

# worker配置
worker_class = 'gthread'
workers = 2 * multiprocessing.cpu_count() + 1  # 2核机器 = 5
threads = 4                                      # 总并发 = 5 * 4 = 20

# 内存保护
max_requests = 2000        # 每个worker处理2000次请求后自动重启，防止内存泄漏
max_requests_jitter = 200  # 重启时间随机抖动，避免所有worker同时重启

# 超时配置
timeout = 30        # worker超时时间，博客接口30s足够
graceful_timeout = 30  # 收到重启信号后，等待请求处理完成的时间
keepalive = 5       # 客户端连接保持时间（秒），减少TCP握手开销

# 日志配置
loglevel = 'info'
access_log_format = '%(t)s %(p)s %(h)s "%(r)s" %(s)s %(L)s %(b)s %(f)s "%(a)s"'
accesslog = "-"   # 标准输出，适合 Docker / systemd 收集日志
errorlog = "-"

# 进程命名（ps aux 时便于识别）
proc_name = 'blog_api'