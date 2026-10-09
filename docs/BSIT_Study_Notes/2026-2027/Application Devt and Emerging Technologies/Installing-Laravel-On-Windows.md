
#  Installing Laravel on Windows  

2026-10-09 18:24

Tags: #ADET 

Author:  Duke Hsu

---

## Topic

1. Requirements
2. Installation Command 
3. Video


## 1. Requirements

**Software:**

??? Details "VSCODE and  extension"
	In left Pane Panel Look for Extensions ( ctrl+Shift+x)  
	Install the following : Laravel, Laravel Blase Snippets & Laravel Snippets
	[https://code.visualstudio.com/downloads](https://code.visualstudio.com/downloads)

- XAMPP - [https://www.apachefriends](https://www.apachefriends)
- COMPOSER - [https://getcomposer.org/download/](https://getcomposer.org/download/)
- GITBASH -  [https://git-scm.com/install/windows](https://git-scm.com/install/windows)


**PHP version requirement**

Laravel 13.* >= PHP 8.3.* 
Laravel 12.* >= PHP 8.2.*

## 2. Installation Command 

### 2.1 Check PHP and Composer Version 

```shell
composer -v

php --version
```

### 2.2 Create Laravel directory 

```shell
cd c:\xampp\htdocs   #go xampp htdocs directory
mkdir -p laravel     #create a directory for laravel
cd laravel           #go laravel directory
```

### 2.3 Create a Laravel  project

```shell
composer create-project laravel/laravel blog
cd blog


php about 

php artisan serve

php artisan make:view home

php artisan make:controller PageController


```

## 3. Video


![https://www.youtube.com/watch?v=_GtJNcEs9AQ](https://www.youtube.com/watch?v=_GtJNcEs9AQ)





----
## References

