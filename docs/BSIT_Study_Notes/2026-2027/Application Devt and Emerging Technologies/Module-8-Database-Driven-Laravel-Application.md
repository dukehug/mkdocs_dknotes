
# Module - 8 Database Driven Laravel Application

2026-10-22 11:00

Tags: #ADET 

Author:  Duke Hsu

---

## Topic

1. Eloquent ORM
2. Migrations
3. Seeders $ Factories
4. Blade
5. CRUD
6. Validation


## 1. Eloquent ORM

Laravel includes Eloquent , an object-relational mapper (ORM) that makes it enjoyable to interact with your database. 

When using Eloquent, each database table has a corresponding "Model" that is used to interact with that table. In addition to retrieving records from the database table, Eloquent models allow you to insert, update, and delete records from the table as well.

### 1.1 Active Record 

Example Code:

```php

// users 資料表 -> App\Models\User 這個Class
// users 表的一行 -> $user 這個Object

$use = User::find(1);// SELECT * FROM users WHERE id = 1
echo $user->name;

$user->name = 'Duke';
$user->save(); // UPDATE users SET name = 'Duke' WHERE id = 1
```


### 1.2  Eloquent 

#### a. Model 

- Once u create a Model
- Eloquent automatic to find table, PK : id , timesmap. 


#### b. Relationships

- hasOne
- hasMany
- belongsTo
- belongsToMany
- morphMany

#### c. Query Builder

Example:
```php
User::where('age', '>', 18)
	->orderBy('created_at')
	->active()
	->take(10)
	->get() //SQL query 
```

#### d. More Object

- Mutators / Casts : Data type translation 
- Accessors : `getFullNameAttribute()`  You can obtain a composite key.
- Soft Deletes： deleted_at , a tag, not hard deleted 
- Events / Observer:  record creating, updated event 


## 2. Migrations

Migrations are like version control for your database, allowing your team to define and share the application's database schema definition. 

If you have ever had to tell a teammate to manually add a column to their local database schema after pulling in your changes from source control, you've faced the problem that database migrations solve.

### 2.1  Migration Structure

```php
// 2026_10_22_000000_create_posts_table.php
public function up() {
    Schema::create('posts', function (Blueprint $table) {
        $table->id();
        $table->string('title');
        $table->text('content');
        $table->foreignId('user_id')->constrained();
        $table->timestamps();
    });
} //up(): what u need to do this time 

public function down() {
    Schema::dropIfExists('posts');
} //down(): roallback

```

- `php artisan migrate`
- `php artisan migrate:rollback`

- Migrate create table 
- Model  mapping the table
- Eloquent operator the table

```shell
make:migration -> migrate -> make:model
```


## 3. Seeders & Factories 

Laravel includes the ability to seed your database with data using seed classes. All seed classes are stored  in the `database/seeders` directory. 

By default, a `DatabaseSeeder` class is defined for you . 

From this class , you may use the `call` method to run other seed classes, allowing you to control the seeding order. 


### 3.1 Seeder 

- Define realistic test data



### 3.2 Factories

- Generate realistic test data


## 4. Blade

- Display the data to front-end 
- Powerful templating engine

Example code:

```php
{{-- Blade --}}
Hello, {{ $name }}

{{-- php --}}
Hello, <?php echo e($name); ?>
```


```php
{{-- pages/home.blade.php --}}
@extends('layouts.app')

@section('content')
    <h1>Title</h1>
    @foreach($users as $user)
        {{ $user->name }}
    @endforeach
@endsection
```







## 5. CRUD

- Create
- Read
- Update
- Delete

Command:

```bash
php artisan make:controller PostController --resource
```


Route:

```php
// routes/web.php
use App\Http\Controllers\PostController;

Route::resource('posts', PostController::class);
```

Same as:

```
GET    /posts          -> index   (列表)
GET    /posts/create   -> create  (顯示建立表單)
POST   /posts          -> store   (執行建立)
GET    /posts/{id}     -> show    (顯示單篇)
GET    /posts/{id}/edit -> edit   (顯示編輯表單)
PUT    /posts/{id}     -> update  (執行更新)
DELETE /posts/{id}     -> destroy (執行刪除)
```

Method:

```php
class PostController extends Controller
{
    // R - Read 列表
    public function index()
    {
        $posts = Post::latest()->paginate(10); // Eloquent 讀取
        return view('posts.index', compact('posts')); // 丟給 Blade
    }

    // C - Create 顯示建立頁
    public function create()
    {
        return view('posts.create');
    }

    // C - Create 執行建立
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|min:3',
            'content' => 'required'
        ]);

        Post::create($validated); // Eloquent 建立，記得在 Model 加 $fillable

        return redirect()->route('posts.index')->with('success', '建立成功');
    }

    // R - Read 單篇
    public function show(Post $post) // 這裡用了 Route Model Binding，自動幫你 findOrFail
    {
        return view('posts.show', compact('post'));
    }

    // U - Update 顯示編輯頁
    public function edit(Post $post)
    {
        return view('posts.edit', compact('post'));
    }

    // U - Update 執行更新
    public function update(Request $request, Post $post)
    {
        $validated = $request->validate([
            'title' => 'required|min:3',
            'content' => 'required'
        ]);

        $post->update($validated);

        return redirect()->route('posts.index')->with('success', '更新成功');
    }

    // D - Delete 執行刪除
    public function destroy(Post $post)
    {
        $post->delete(); // 如果有 SoftDeletes，就變成軟刪除

        return redirect()->route('posts.index')->with('success', '刪除成功');
    }
}

```

## 6. Validation 

Laravel provides several different approaches to validate your application's incoming data. It is most common to use the `validate` method available on all incoming HTTP requests.

Example Code:

```php
/**
 * Store a new blog post.
 */
public function store(Request $request): RedirectResponse
{
    $validated = $request->validate([
        'title' => ['required', 'unique:posts', 'max:255'],
        'body' => ['required'],
    ]);

    // The blog post is valid...

    return redirect('/posts');
}
```



## 7. Full Flow: Create a Post

```
1. Migration creates posts table
2. Post model with fillable & user() relationship  - 1 user hasMany post
3. StorePostRequest defines validation rules  - use input
4. PostController@store receives validated data
5. Blade form uses @csrf and @error
6. Success redirects with flash message 
```



----
## References


[https://laravel.com/framework/docs/13.x/eloquent](https://laravel.com/framework/docs/13.x/eloquent)

PPT Module 8

