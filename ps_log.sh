#!/bin/bash

while true; do
    ps aux --sort -'%cpu' > /home/ubuntu/nextNEOpi/ps_log/ps_aux_$(date '+%Y%m%d%H%M%S').log
    sleep 300
done
