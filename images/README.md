# รูปภาพประกอบคู่มือ TOKO

วางไฟล์รูปทั้งหมดในโฟลเดอร์นี้ แล้วอ้างอิงจากไฟล์ Markdown ด้วย path สัมพัทธ์

## วิธีตั้งชื่อไฟล์ (แนะนำ)

ใช้รูปแบบ `chXX_section_description.png` เพื่อให้เรียงตามบท

ตัวอย่าง:
- `ch01_login_screen.png` — หน้าจอเข้าสู่ระบบ (บทที่ 1)
- `ch02_register_step1.png` — ขั้นตอนสมัคร 1
- `ch02_otp_input.png` — กรอก OTP
- `ch03_bottom_nav.png` — เมนูล่าง
- `ch07_delivery_step1.png` — ตั้งค่า Delivery ขั้น 1
- `ch12_order_list.png` — รายการออเดอร์

## วิธีอ้างอิงรูปใน Markdown

```markdown
![หน้าจอเข้าสู่ระบบ](images/ch01_login_screen.png){width=60%}

![รูปที่ 2.1 กรอก OTP 6 หลัก](images/ch02_otp_input.png){width=70%}
```

## คำแนะนำเรื่องรูป

- **ความละเอียด:** 150–300 dpi สำหรับ PDF
- **ขนาดไฟล์:** ย่อให้ < 500 KB ต่อรูป (ใช้ `pngquant` หรือ `tinypng`)
- **อัตราส่วน:** หน้าจอมือถือ 9:19.5 → ใช้ `width=50%` หรือ `width=6cm`
- **ฟอร์แมต:** PNG (UI screenshot), JPG (ภาพถ่าย), SVG (ไอคอน/ไดอะแกรม)

## ตัวอย่างขั้นสูง

### วางรูปข้างกัน 2 รูป
```markdown
\begin{minipage}{0.48\textwidth}
\includegraphics[width=\linewidth]{images/ch01_before.png}
\centering ก่อน
\end{minipage}
\hfill
\begin{minipage}{0.48\textwidth}
\includegraphics[width=\linewidth]{images/ch01_after.png}
\centering หลัง
\end{minipage}
```

### บังคับให้รูปอยู่ตำแหน่งเดียวกับข้อความ
```markdown
![](images/ch01_login.png){width=60%}\
```
(ลงท้ายด้วย `\` เพื่อไม่ให้กลายเป็น figure ลอย)
