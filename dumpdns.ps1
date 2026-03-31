$domain = "k1apps.dev"
"A","AAAA","MX","TXT","NS","SOA","CNAME" | ForEach-Object {
    "`n=== $_ ==="
    Resolve-DnsName $domain -Type $_ -ErrorAction SilentlyContinue
}