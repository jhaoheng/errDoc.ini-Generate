# errDoc.ini-Generate

隱藏私有的代號標誌，輸出公開的規格

## input format [.ini]

```
[General]
_01      = G0001;    驗證必要參數失敗，請檢查 透過手冊檢查參數對應是否正確
_02      = G0002;    ctk & utk error
_03      = G0003;    ctk error
_04      = G0004;    utk error
_05      = G0005;    資料庫寫入失敗

[User]
_su01    = U0001;    註冊失敗, User already signUp.

_ac01    = U0011;    啟用失敗, activation_code error.

_si01    = U0021;    授權失敗, CTK/ email/ pw 無法匹配
_si02    = U0022;    帳號已被刪除, 請重新註冊
_si03    = U0023;    帳號尚未啟用
```

## output format

```
[General]
G0001; 驗證必要參數失敗，請檢查 透過手冊檢查參數對應是否正確
G0002; ctk & utk error
G0003; ctk error
G0004; utk error
G0005; 資料庫寫入失敗
 
[User]
U0001; 註冊失敗, User already signUp.
U0011; 啟用失敗, activation_code error.
U0021; 授權失敗, CTK/ email/ pw 無法匹配
U0022; 帳號已被刪除, 請重新註冊
U0023; 帳號尚未啟用
```
