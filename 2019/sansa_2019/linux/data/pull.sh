#!/bin/bash

for i in {001..240}
do
  wget -x ftp://ftp.trignet.co.za/RefData.19/$i/15sec_daily/BETH*
  wget -x ftp://ftp.trignet.co.za/RefData.19/$i/15sec_daily/CALV*
done
