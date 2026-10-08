
# Laravel  Hands-On

2026-10-09 00:01

Tags:  #Laravel #ADET 

Author:  Duke Hsu

---


# Laravel CRUD 學習總結

## 1. 核心觀念：MVC 與一次請求的流程

```
瀏覽器 → Route → Controller → Model → SQLite
                      ↓
                    View → 瀏覽器
```

|角色|負責|餐廳類比|檔案位置|
|---|---|---|---|
|Route|決定網址交給誰|櫃檯接單|`routes/web.php`|
|Controller|處理請求、協調|服務生|`app/Http/Controllers/`|
|Model|讀寫一張資料表|倉庫管理員|`app/Models/`|
|View|顯示畫面|擺盤|`resources/views/`|
|Migration|定義資料表結構|倉庫的建置圖|`database/migrations/`|

最容易搞混的一點：**`Schema::create` 屬於 migration，不屬於 Model**。

## 2. 常用 artisan 指令

```bash
composer create-project laravel/laravel <name>   # 建立專案
php artisan serve --host=0.0.0.0                 # 啟動伺服器
php artisan make:model Resident -m               # Model + migration
php artisan make:controller ResidentController   # Controller
php artisan make:view residents.create           # View（. 代表子資料夾）
php artisan migrate                              # 執行 migration（保留資料）
php artisan migrate:fresh                        # 刪光重建（資料清空）
php artisan route:list                           # 查看所有 route
php artisan tinker                               # 互動式測試
```

## 3. CRUD 對照表

|動作|HTTP 方法|網址|Controller 方法|
|---|---|---|---|
|顯示列表|GET|`/home`|`PageController@home`|
|顯示新增表單|GET|`/residents/create`|`create`|
|儲存新資料|POST|`/residents`|`store`|
|顯示編輯表單|GET|`/residents/{resident}/edit`|`edit`|
|儲存修改|PUT|`/residents/{resident}`|`update`|
|刪除|DELETE|`/residents/{resident}`|`destroy`|

## 4. 表單的必備元素

```php
<form method="POST" action="/residents/{{ $resident->id }}">
    @csrf                 // 所有 POST/PUT/DELETE 都要
    @method('PUT')        // 編輯用 PUT，刪除用 DELETE
    <input name="name" value="{{ old('name', $resident->name) }}">
    @error('name') <p>{{ $message }}</p> @enderror
</form>
```

- `@csrf`：安全機制，漏了會 `419`
- `@method`：HTML 表單只能 GET/POST，這是偽裝成 PUT/DELETE，漏了會 `405`
- `old()`：驗證失敗時保留輸入
- `name` 屬性必須和資料表欄位、驗證規則的鍵一致

## 5. 這次遇到的錯誤速查

|錯誤訊息|原因|解法|
|---|---|---|
|`could not find driver`|PHP 缺 SQLite 擴充|`sudo apt install php8.3-sqlite3`|
|`no such table: sessions`|還沒跑 migration|`php artisan migrate`|
|tinker `Class "Resident" not found`|沒寫命名空間|`App\Models\Resident::create(...)`|
|`ParseError ... "Schema"`|migration 程式碼貼進了 Model|用 `php -l 檔案` 找出，貼回正確檔案|
|`Target class [ResidentController] does not exist`|`routes/web.php` 漏了 `use`|補上 `use App\Http\Controllers\ResidentController;`|
|`Class "...\Resuest" does not exist`|拼字錯誤|改成 `Request`，用 `grep -n` 找錯字|
|`419 Page Expired`|表單漏 `@csrf`|補上|
|`405 Method Not Allowed`|漏 `@method('PUT')` 等|補上|

**除錯心法**：看到 `Class ... does not exist`，先檢查兩件事，拼字和 `use`。看到 ParseError，用 `php -l` 定位。

## 6. 其他重點

- **`$fillable`**：只管「寫入」允許的欄位；讀取（如 `created_at`）不受影響，所以顯示欄位只需改 view
- **`validate()`**：不合格會自動導回表單，合格才往下執行
- **Route model binding**：route 的 `{resident}` 和 controller 的 `$resident` 名稱要一致，Laravel 自動依 id 找資料，找不到回 404
- **刪除要用 form 送 DELETE**，不要用 `<a>` 連結（GET 請求可能被預載誤觸）
- **時區**：預設 UTC，馬尼拉改 `config/app.php` 的 `'timezone' => 'Asia/Manila'`
- **`laravel new` 與 `composer create-project`**：後者是教授的標準做法；用前者時 starter kit 選 none 結果相近

## 7. 複習練習

1. 不看筆記，從零新增 `phone` 欄位，列出要改的五個地方：migration、`$fillable`、驗證規則、表單、列表顯示
2. 用 `php artisan make:model Product -m` 做一個完全不同主題的 CRUD，檢驗自己是否真的理解流程，而不是在複製貼上
3. 之後可以學的下一步：`resource` route（一行取代六條 route）、Model 之間的關聯（一對多）、分頁 `paginate()`



----
## References

Claude

