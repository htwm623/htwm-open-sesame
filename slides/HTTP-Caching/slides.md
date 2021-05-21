---
# try also 'default' to start simple
theme: seriph
# random image from a curated Unsplash collection by Anthony
# like them? see https://unsplash.com/collections/94734566/slidev
background: https://source.unsplash.com/collection/94734566/1920x1080
# apply any windi css classes to the current slide
class: 'text-center'
# https://sli.dev/custom/highlighters.html
highlighter: shiki
# some information about the slides, markdown enabled
info: |
  ## HTTP caching slide
---

# HTTP caching


<!--
The last comment block of each slide will be treated as slide notes. It will be visible and editable in Presenter Mode along with the slide. [Read more in the docs](https://sli.dev/guide/syntax.html#notes)
-->

---

# 什么是缓存
<br>

- 凡是位于速度相差较大的两种硬件之间，用于协调两者数据传输速度差异的结构，均可称之为缓存

<br>
<br>
<br>


# Http caching
- 通过重复使用以前获取的资源，可以显著提高网站和应用程序的性能。
- Web 缓存可减少延迟和网络流量，从而减少显示资源表示所需的时间。
- 通过使用 HTTP 缓存，网站变得更加响应。

<style>
h1 {
  margin-top: 20px;
}

</style>

---

# 问题1, 刷新页面时 图片是否会有缓存
- http://localhost:3000/public/index.html

---

# header 字段

- **Pragma** - 只有一个值 no-cache(http/1.0)
- **Expries** - 值是一个HTTP日期(http/1.0)
- **Cache-Control** - (http/1.1) 常用指令如下,  
  - max-age,no-cache,no-store,private,public
  - 完整参考资料 [MDN Cache-Control](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control)
- 验证相关header
  - Etag
  - Last-Modified
  - If-Modified-Since
  - If-None-Match
--- 

<div>
  <img style="width:600px;margin-left:120px" border="rounded" src="https://cdn.jsdelivr.net/gh/htwm623/static/2021/http-cache.png">
</div>

---

# header
<div>
  <img style="width:500px;margin-left:160px" border="rounded" src="https://cdn.jsdelivr.net/gh/htwm623/static/2021/2021-05-20_012558.png">
</div>

---

# 默认缓存时间: 

- 必须包含 last_modified_time

- (响应时间 - last_modified_time) / 10
<br>

- 参考资料 [rfc7234](https://datatracker.ietf.org/doc/html/rfc7234#section-4.2.2)
- 参考资料 [chromium #http_response_headers.cc](https://github.com/chromium/chromium/blob/7154324c2a5eea5be085b2ce8948db1af9d05cee/net/http/http_response_headers.cc#L985)

---

# 关于html 页面中的meta

```js
<meta http-equiv="Cache-Control" content="no-store" />
```
- 结论： html中使用该标签没有效果
- 原因1: 请求都基于http, http优先; 
- 原因2: 在html5标准中 http-equiv的枚举值并没有Cache-control 
- 参考资料: [stackoverflow](https://stackoverflow.com/questions/49547/how-do-we-control-web-page-caching-across-all-browsers/2068407#2068407) 
- 参考资料: [html living standard #pragma-directives](https://html.spec.whatwg.org/multipage/semantics.html#pragma-directives)

---
layout: center
class: text-center
---

# 谢谢
- 幻灯片由[slidev](https://sli.dev)驱动
<br>
- 绘图工具 draw.io

---
