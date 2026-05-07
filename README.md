# toko-document

คู่มือระบบ TOKO

- `TOKO_Shop_Manual.md` — คู่มือใช้งานสำหรับร้านค้า (Merchant Manual) — รวมบท §10.8 การอัปเดตร้าน Field 3 (Delivery Service)
- `TOKO_Operation_Manual.md` — คู่มือปฏิบัติงาน DevOps (Server / Scheduler / Earnings flow)

## Build

```bash
./build.sh                 # PDF + DOCX ทั้ง 2 เล่ม
./build.sh pdf             # PDF อย่างเดียว ทั้ง 2 เล่ม
./build.sh docx            # DOCX อย่างเดียว ทั้ง 2 เล่ม
./build.sh all shop        # เฉพาะ Shop Manual
./build.sh pdf ops         # เฉพาะ Operation Manual (PDF)
```

## Files

- `TOKO_Shop_Manual.md` — source คู่มือร้านค้า
- `TOKO_Operation_Manual.md` — source คู่มือ ops
- `header.tex` — LaTeX preamble
- `reference.docx` — Word template
- `build.sh` — สคริปต์ build
- `images/` — รูปประกอบ

