# Academic Profile — bongojuniorrr.github.io

Trang academic profile cá nhân, build bằng [Astro](https://astro.build), host miễn phí trên GitHub Pages.

**Nguyên tắc vàng: muốn sửa nội dung, chỉ cần sửa file JSON trong `src/data/` — không bao giờ phải đụng vào code.** Push lên nhánh `main` là site tự build và cập nhật sau ~1 phút.

## 🔑 Muốn sửa gì → mở file nào

| Muốn sửa | File |
|---|---|
| Tên, tagline, bio, avatar, social links, email | `src/data/profile.json` |
| Tiêu đề site, mô tả SEO, footer | `src/data/site.json` |
| Tin tức / cập nhật (News) | `src/data/news.json` |
| Publications | `src/data/publications.json` |
| Giải thưởng (Honors & Awards) | `src/data/awards.json` |
| Kinh nghiệm (Experience) | `src/data/experience.json` |
| Học vấn (Education) | `src/data/education.json` |
| Projects | `src/data/projects.json` |
| Kỹ năng + hướng nghiên cứu | `src/data/skills.json` |
| Ảnh đại diện | Thay file `public/avatar.png` (giữ nguyên tên) |
| CV (nút Download CV) | Thay file `public/cv.pdf` (giữ nguyên tên) |
| Bài blog | Thêm file `.md` vào `src/content/blog/` |

> ⚠️ Các mục ghi `PLACEHOLDER` là dữ liệu mẫu — thay bằng thông tin thật của bạn.

## 📝 Ví dụ chỉnh sửa từng loại

### Thêm một publication

Mở `src/data/publications.json`, thêm một object vào mảng:

```json
{
  "title": "Tên paper",
  "authors": ["Tran Huu Vu Phuong", "Đồng tác giả A", "Đồng tác giả B"],
  "venue": "NeurIPS 2027",
  "year": 2027,
  "links": {
    "pdf": "https://.../paper.pdf",
    "arxiv": "https://arxiv.org/abs/xxxx.xxxxx",
    "code": "https://github.com/..."
  },
  "abstract": "Dán abstract vào đây...",
  "selected": true
}
```

- `selected: true` → hiện ở mục **Selected Publications** trên trang chủ. Tất cả publication luôn hiện đầy đủ ở trang `/publications` (tự nhóm theo năm).
- Link nào không có thì để chuỗi rỗng `""`.
- **Tên của bạn được tự động in đậm** trong danh sách tác giả — miễn là cách viết tên khớp một trong các biến thể trong `name_variants` (file `profile.json`). Nếu paper ghi tên bạn theo kiểu khác (ví dụ `P. H. V. Tran`), thêm biến thể đó vào `name_variants`.

### Thêm một tin News

Mở `src/data/news.json`:

```json
{
  "date": "2027-03",
  "text": "Our paper was accepted at <b>NeurIPS 2027</b>! 🎉",
  "link": "https://arxiv.org/abs/xxxx.xxxxx"
}
```

- `date` theo dạng `YYYY-MM` (tự hiển thị thành "Mar 2027", tự sắp xếp mới nhất lên đầu, trang chủ hiện 5 tin mới nhất).
- `text` được phép chứa HTML (`<b>`, `<i>`, `<a>`). `link` có thể bỏ trống.

### Thêm một giải thưởng

Mở `src/data/awards.json`:

```json
{
  "year": "2027",
  "title": "First Prize, XYZ Competition",
  "organization": "Tên tổ chức trao giải",
  "description": ""
}
```

### Thêm một project

Mở `src/data/projects.json`:

```json
{
  "name": "Tên project",
  "description": "Mô tả ngắn gọn.",
  "tags": ["NLP", "PyTorch"],
  "links": { "github": "https://github.com/...", "demo": "" },
  "image": "/projects/ten-anh.png",
  "featured": true
}
```

- `featured: true` → hiện ở trang chủ; tất cả project hiện ở `/projects`.
- `image` (tuỳ chọn): bỏ ảnh vào thư mục `public/projects/` rồi ghi đường dẫn bắt đầu bằng `/`.

### Viết một bài blog

Tạo file mới trong `src/content/blog/`, ví dụ `2027-01-15-my-post.md` (tên file trở thành URL):

```markdown
---
title: "Tiêu đề bài viết"
date: 2027-01-15
description: "Tóm tắt ngắn hiện ở trang danh sách blog."
tags: [research, notes]
---

Nội dung viết bằng Markdown bình thường...
```

Xem file mẫu `src/content/blog/hello-world.md`.

## 🚀 Chạy thử trên máy (không bắt buộc)

```bash
npm install        # chỉ cần lần đầu
npm run dev        # mở http://localhost:4321, tự reload khi sửa file
npm run build      # build thử để kiểm tra lỗi trước khi push
```

Không muốn chạy local? Cứ sửa JSON rồi push (hoặc sửa trực tiếp trên github.com) — GitHub Actions sẽ build giúp bạn. Nếu site không cập nhật, vào tab **Actions** trên GitHub xem workflow có báo lỗi không (thường là lỗi JSON thiếu dấu phẩy/ngoặc).

## 🌐 Deploy

- Push lên `main` → workflow `.github/workflows/deploy.yml` tự build và deploy lên GitHub Pages.
- Site: **https://bongojuniorrr.github.io**

## 🗂 Cấu trúc code (chỉ cần biết khi muốn đổi giao diện)

```
src/
├── data/          ← ★ toàn bộ nội dung (JSON)
├── content/blog/  ← bài blog (Markdown)
├── components/    ← các khối giao diện (Nav, Hero, PublicationItem, ...)
├── layouts/       ← khung trang chung (BaseLayout)
├── pages/         ← các trang: index, publications, projects, blog, 404
└── styles/global.css ← màu sắc, font (đổi theme ở biến CSS `:root`)
```

Đổi màu accent, nền, font: sửa các biến trong `src/styles/global.css` (`--accent`, `--bg`, ...) — có sẵn 2 bộ token cho light và dark mode.
