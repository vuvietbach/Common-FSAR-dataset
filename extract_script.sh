mkdir -p extract_data/hmdb && \
mkdir -p data/hmdb51/videos && \
unrar x -r raw_file/hmdb.rar extract_data/hmdb && \
find extract_data/hmdb/ -type f -name "*.rar" -exec unrar x -kb {} data/hmdb51/videos \;

mkdir -p extract_data/ucf101 && \
rm -rf data/ucf101/videos && \
unrar x -r raw_file/ucf.rar data/ucf101 && \
mv data/ucf101/UCF-101 data/ucf101/videos
# find extract_data/ucf101/ -type f -name "*.rar" -exec unrar x -kb {} data/ucf101/videos \;

rm -rf data/kinetics/videos && \
unzip raw_file/kinetics.zip -d data/kinetics && mv data/kinetics/kinetics_100 data/kinetics/videos

rm -rf data/ssv2/videos && \
unzip raw_file/ssv2.zip -d data/ssv2 && mv data/ssv2/smsm_otam data/ssv2/videos && \
find data/ssv2/videos/ -type f -name "*.webm" -exec sh -c 'ffmpeg -i "$0" -vf "scale='\''if(gt(mod(iw,2),0),iw-1,iw)'\'':'\''if(gt(mod(ih,2),0),ih-1,ih)'\''" -y  "$(dirname "{}")/$(basename "{}" .webm).mp4" && rm "$0"' {} \;

# python code/generate_annotation.py
# find data/ssv2/videos/ -type f -name "*.webm" -exec sh -c 'ffmpeg -i "$0" -vf "scale='\''if(gt(mod(iw,2),0),iw-1,iw)'\'':'\''if(gt(mod(ih,2),0),ih-1,ih)'\''" -y  "$(dirname "{}")/$(basename "{}" .webm).mp4" && rm "$0"' {} \;