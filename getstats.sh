#!/bin/bash
while :
do
   curl https://js.adapools.org/pools/d77e214c0e20f82001f5acb7042abfd7979f83e7f6019efcaedcbed2/summary.json 2>/dev/null \
| jq '.data | del(.hist_bpe, .handles, .hist_roa, .db_ticker, .db_name, .db_url, .ticker_orig, .pool_id, .pool_id_bech32, .db_description )' \
| tr -d \"{},: \
| awk NF \
| sed -e 's/^[ \t]*/adapools_/' > /script/adapools.prom
   sleep 1800
done