# Common-FSAR-dataset
This repository contains download script for common few-shot action recognition dataset. To download dataset, use the commmand bash download_script.sh. The source of kinetics and ssv2 is https://box.nju.edu.cn/d/dc97163752fc4024be2c/. In case the urls for ssv2 and kinetics don't work please get new urls from the given link.

## Steps to setup data
1. Clone this repository or download the script files to your local machine.

2. Run download_script.sh to download the data

3. Run extract_script.sh to extract the data to the destination

The result folder will have the following structure
- **data**
    - **ssv2**
        - **annotations**
        - **videos**
    - ...
        - ...
        - ...