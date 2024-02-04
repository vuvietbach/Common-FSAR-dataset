mkdir -p dataset download_progress raw_file
wget --no-check-certificate -O raw_file/ssv2.zip  https://box.nju.edu.cn/seafhttp/files/64bf9a11-7679-422c-bb81-313b6ab349ec/smsm_otam.zip -o download_progress/ssv2.log && unzip raw_file/ssv2.zip -d dataset -o >> download_progress/ssv2.log &
wget --no-check-certificate -O raw_file/kinetics.zip  https://box.nju.edu.cn/seafhttp/files/ceac0d0a-846b-47dd-b24c-f118bd21a98d/kinetics_100.zip -o download_progress/kinetics.log && unzip raw_file/kinetics.zip -d dataset -o >> download_progress/kinetics.log &
wget --no-check-certificate -O raw_file/ucf.rar  https://www.crcv.ucf.edu/data/UCF101/UCF101.rar -o download_progress/ucf.log && unrar x -o+ raw_file/ucf.rar -d dataset >> download_progress/ucf.log &
wget --no-check-certificate -O raw_file/hmdb.rar  http://serre-lab.clps.brown.edu/wp-content/uploads/2013/10/hmdb51_org.rar -o download_progress/hmdb.log && unrar x -o+ raw_file/hmdb.rar -d dataset >> download_progress/hmdb.log &
