mkdir -p data download_log raw_file
wget --no-check-certificate -O raw_file/ssv2.zip  https://box.nju.edu.cn/seafhttp/files/64bf9a11-7679-422c-bb81-313b6ab349ec/smsm_otam.zip -o download_log/ssv2.log & echo "ssv2 $!" >> pids.log
wget --no-check-certificate -O raw_file/kinetics.zip  https://box.nju.edu.cn/seafhttp/files/ceac0d0a-846b-47dd-b24c-f118bd21a98d/kinetics_100.zip -o download_log/kinetics.log & echo "kinetics $!" >> pids.log
wget --no-check-certificate -O raw_file/ucf.rar  https://www.crcv.ucf.edu/data/UCF101/UCF101.rar -o download_log/ucf.log >> download_log/ucf.log & echo "ucf $!" >> pids.log
wget --no-check-certificate -O raw_file/hmdb.rar  http://serre-lab.clps.brown.edu/wp-content/uploads/2013/10/hmdb51_org.rar -o download_log/hmdb.log & echo "hmdb $!" >> pids.log

# wget --no-check-certificate -O raw_file/ssv2.zip  https://box.nju.edu.cn/seafhttp/files/64bf9a11-7679-422c-bb81-313b6ab349ec/smsm_otam.zip -o download_log/ssv2.log && unzip raw_file/ssv2.zip -d dataset -o >> download_progress/ssv2.log & echo "ssv2 $!" >> pids.log
# wget --no-check-certificate -O raw_file/kinetics.zip  https://box.nju.edu.cn/seafhttp/files/ceac0d0a-846b-47dd-b24c-f118bd21a98d/kinetics_100.zip -o download_progress/kinetics.log && unzip raw_file/kinetics.zip -d dataset -o >> download_progress/kinetics.log & echo "kinetics $!" >> pids.log
# wget --no-check-certificate -O raw_file/ucf.rar  https://www.crcv.ucf.edu/data/UCF101/UCF101.rar -o download_progress/ucf.log && unrar x -o+ raw_file/ucf.rar -d dataset >> download_progress/ucf.log & echo "ucf $!" >> pids.log
# wget --no-check-certificate -O raw_file/hmdb.rar  http://serre-lab.clps.brown.edu/wp-content/uploads/2013/10/hmdb51_org.rar -o download_progress/hmdb.log & echo "hmdb $!" >> pids.log