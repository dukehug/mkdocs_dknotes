
# LAB - Prelim Exercise 4   PHP  Activity 

2026-09-03 11:34

Tags: #Docker

Author:  Duke Hsu

---

## Create Docker-file

安裝php 基礎鏡像和MySQL 支援

```dockerfile
FROM php:8.2-fpm

# 安裝系統依賴
RUN apt-get update && apt-get install -y \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

# 安裝 PHP MySQL 擴展
RUN docker-php-ext-install mysqli pdo pdo_mysql

CMD ["php-fpm"]

```


## Create `docker-compose.yml`

定義3個容器的服務、網路、存儲

```yaml
version: '3.8'

services:
  # PHP-FPM 服務
  php:
    build: .
    container_name: php-app
    ports:
      - "9000:9000"
    volumes:
      - ./www:/var/www/html
    depends_on:
      - mysql
    networks:
      - app-network

  # MySQL 服務
  mysql:
    image: mysql:8.0
    container_name: mysql-app
    ports:
      - "3306:3306"
    environment:
      MYSQL_ROOT_PASSWORD: MySecureRoot123
      MYSQL_DATABASE: homework_db
      MYSQL_USER: student
      MYSQL_PASSWORD: StudentPass456
    volumes:
      - mysql_data:/var/lib/mysql
    networks:
      - app-network

  # Nginx 網頁伺服器
  nginx:
    image: nginx:latest
    container_name: nginx-app
    ports:
      - "80:80"
    volumes:
      - ./www:/var/www/html
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
    depends_on:
      - php
    networks:
      - app-network

volumes:
  mysql_data:

networks:
  app-network:
    driver: bridge

```

## Create `nginx.conf`

```nginx
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log warn;
pid /var/run/nginx.pid;

events {
    worker_connections 1024;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';

    access_log /var/log/nginx/access.log main;
    sendfile on;
    tcp_nopush on;
    keepalive_timeout 65;
    gzip on;

    server {
        listen 80;
        server_name localhost;
        root /var/www/html;
        index index.php;

        location ~ \.php$ {
            fastcgi_pass php:9000;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include fastcgi_params;
        }

        location / {
            try_files $uri $uri/ /index.php?$query_string;
        }
    }
}

```

目錄結構 

```
/2026-2027/29082_Lab_Exercise_3/
├── docker-compose.yml
├── Dockerfile
├── nginx.conf
└── www/
    └── index.php

```


## Run docker 

```shell
docker-compose up -d --build #-d後臺運行，--build 重新構建


```



----
## Docker + PHP + MySQL 環境配置完整流程

---

## 前置準備

### 系統需求
- **Linux 系統**（支援 Docker）
  - Arch Linux：`sudo pacman -S docker docker-compose`
  - Ubuntu/Debian：`sudo apt-get install docker.io docker-compose`
- **Docker 已啟動**：`sudo systemctl start docker`
- **用戶加入 docker 組**（可選，避免每次都用 sudo）：`sudo usermod -aG docker $USER`

### 目錄結構
```
/2026-2027/29082_Lab_Exercise_3/
├── docker-compose.yml
├── Dockerfile
├── nginx.conf
└── www/
    └── index.php
```

---

## 步驟 1：建立 Dockerfile

**位置**：`/2026-2027/29082_Lab_Exercise_3/Dockerfile`

```dockerfile
FROM php:8.2-fpm

# 安裝系統依賴
RUN apt-get update && apt-get install -y \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

# 安裝 PHP MySQL 擴展
RUN docker-php-ext-install mysqli pdo pdo_mysql

CMD ["php-fpm"]
```

**作用**：擴展基礎 PHP 鏡像，新增 MySQL 支援

---

## 步驟 2：建立 docker-compose.yml

**位置**：`/29082_Lab_Exercise_3/docker-compose.yml`

```yaml
version: '3.8'

services:
  php:
    build: .
    container_name: php-app
    volumes:
      - ./www:/var/www/html  # 改為 www 目錄
    ports:
      - "9000:9000"
    depends_on:
      - mysql
    networks:
      - app-network

  mysql:
    image: mysql:8.0
    container_name: mysql-app
    environment:
      MYSQL_ROOT_PASSWORD: root_password
      MYSQL_DATABASE: my_app
      MYSQL_USER: app_user
      MYSQL_PASSWORD: app_password
    volumes:
      - mysql_data:/var/lib/mysql  
    ports:
      - "3306:3306"
    networks:
      - app-network

  nginx:
    image: nginx:latest
    container_name: nginx-app
    volumes:
      - ./www:/var/www/html
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
    ports:
      - "80:80"
    depends_on:
      - php
    networks:
      - app-network
  
  adminer:
    image: adminer:latest
    container_name: adminer-app
    ports:
      - "8080:8080"
    depends_on:
      - mysql
    networks:
      - app-network
    environment:
      ADMINER_DEFAULT_SERVER: mysql

  phpmyadmin:
    image: phpmyadmin/phpmyadmin:latest
    container_name: phpmyadmin_ui
    ports:
      - "8081:80"
    depends_on:
      - mysql
    networks:
      - app-network
    environment:
      PMA_HOST: mysql
      PMA_USER: app_user
      PMA_PASSWORD: app_password
      PMA_DB: my_app


volumes:
  mysql_data:

networks:
  app-network:
    driver: bridge


```

**作用**：定義三個容器服務、網絡和存儲

---

## 步驟 3：建立 nginx.conf

**位置**：`/2026-2027/29082_Lab_Exercise_3/nginx.conf`

```nginx
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log warn;
pid /var/run/nginx.pid;

events {
    worker_connections 1024;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';

    access_log /var/log/nginx/access.log main;
    sendfile on;
    tcp_nopush on;
    keepalive_timeout 65;
    gzip on;

    server {
        listen 80;
        server_name localhost;
        root /var/www/html;
        index index.php;

        location ~ \.php$ {
            fastcgi_pass php:9000;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include fastcgi_params;
        }

        location / {
            try_files $uri $uri/ /index.php?$query_string;
        }
    }
}
```

**作用**：配置 Nginx 反向代理，將請求轉發到 PHP-FPM

---

## 步驟 4：建立 www 目錄和測試 PHP 文件

```bash
mkdir -p ./www
```

**位置**：`/2026-2027/29082_Lab_Exercise_3/www/index.php`

```php
<?php
// MySQL 連接設定
$host = 'mysql';        // Docker 容器內部主機名
$user = 'student';
$password = 'StudentPass456';
$database = 'homework_db';

// 建立連接
$conn = new mysqli($host, $user, $password, $database);

// 檢查連接
if ($conn->connect_error) {
    die('連接失敗: ' . $conn->connect_error);
}

echo '連接成功!';
echo '<br>';
echo '伺服器資訊: ' . $conn->server_info;

$conn->close();
?>
```

**作用**：測試 PHP 和 MySQL 的連接

---

## 步驟 5：啟動容器

進入項目目錄：

```bash
cd /2026-2027/29082_Lab_Exercise_3
```

首次構建並啟動：

```bash
docker-compose up -d --build
```

參數說明：
- `-d`：後台運行（detached 模式）
- `--build`：首次必須加此參數，重新構建鏡像

---

## 步驟 6：驗證環境

### 檢查容器狀態

```bash
docker-compose ps
```

應該看到三個 `Up` 的容器：
- `php-app`
- `mysql-app`
- `nginx-app`

### 檢查 PHP 擴展

```bash
docker exec -it php-app bash
php -m | grep -i mysql
```

應該看到：
- `mysqli`
- `pdo_mysql`

### 查看即時日誌

```bash
docker-compose logs -f php
```

按 `Ctrl+C` 退出

---

## 步驟 7：測試連接

訪問瀏覽器：**`http://localhost`**

應該看到：
```
連接成功!
伺服器資訊: 8.0.x-0
```

---

## 常用命令速查表

| 操作 | 命令 |
|------|------|
| **首次啟動** | `docker-compose up -d --build` |
| **後續啟動** | `docker-compose up -d` |
| **停止容器** | `docker-compose down` |
| **完全清理**（含數據） | `docker-compose down -v` |
| **查看容器狀態** | `docker-compose ps` |
| **查看日誌** | `docker-compose logs -f php` |
| **進入 PHP 容器** | `docker exec -it php-app bash` |
| **進入 MySQL 容器** | `docker exec -it mysql-app bash` |
| **連接 MySQL**（在容器內） | `mysql -h mysql -u student -p homework_db` |
| **重新構建鏡像** | `docker-compose up -d --build` |

---

## MySQL 連接資訊速查表

| 項目 | 值 |
|------|-----|
| **容器內連接主機** | `mysql` |
| **主機連接地址** | `127.0.0.1` 或 `localhost` |
| **端口** | `3306` |
| **Root 密碼** | `MySecureRoot123` |
| **數據庫名稱** | `homework_db` |
| **應用用戶** | `student` |
| **應用密碼** | `StudentPass456` |

---

## PHP 連接代碼模板

```php
<?php
$conn = new mysqli('mysql', 'student', 'StudentPass456', 'homework_db');

if ($conn->connect_error) {
    die('連接失敗: ' . $conn->connect_error);
}

// 執行查詢
$result = $conn->query("SELECT * FROM your_table");

// 處理結果
while($row = $result->fetch_assoc()) {
    echo $row['column_name'];
}

$conn->close();
?>
```

---

## 常見問題排查

| 問題 | 解決方案 |
|------|---------|
| **could not find driver** | 確認 Dockerfile 已執行 `docker-php-ext-install mysqli pdo pdo_mysql`，重新執行 `docker-compose up -d --build` |
| **連接拒絕** | 檢查 MySQL 容器是否正常運行：`docker-compose ps` |
| **Port 已被占用** | 修改 `docker-compose.yml` 中的 port，例如 `"3307:3306"` |
| **網頁無法訪問** | 檢查 Nginx 日誌：`docker-compose logs nginx-app` |
| **權限不足** | 使用 `sudo` 或加入 docker 組：`sudo usermod -aG docker $USER` |


----
## References
