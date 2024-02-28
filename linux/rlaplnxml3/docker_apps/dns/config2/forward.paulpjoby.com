;
; BIND data file for local loopback interface
;
$TTL 20
@ IN SOA home.shinshinet. root.home.shinshinet. (
         2  ; Serial
         20 ; Refresh
         20 ; Retry
         20  ; Expire
         20 ) ; Negative Cache TTL
;
@       IN    NS      home.shinshinet.
@       IN    A       192.168.100.4
www     IN    A       192.168.100.4
@       IN    AAAA    1234:1234::1

; -- add dns records below this line --

rlapmini          IN    A   192.168.100.80
rlapstudio        IN    A   192.168.100.68
rlaplenovo        IN    A   192.168.100.64
rlaplnxml1        IN    A   192.168.100.85
rlaplnxml2        IN    A   192.168.100.4
rlaplnxml3        IN    A   192.168.100.23
rlaplapm1         IN    A   192.168.100.92

;