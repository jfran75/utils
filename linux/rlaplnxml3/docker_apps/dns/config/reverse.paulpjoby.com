;
; BIND reverse data file for local loopback interface
;
$TTL 20
@ IN SOA paulpjoby.com. root.paulpjoby.com (
         1  ; Serial
        20  ; Refresh
        20  ; Retry
        20  ; Expire
        20 ) ; Negative Cache TTL
;
@ IN NS paulpjoby.com.
100 IN PTR paulpjoby.com.