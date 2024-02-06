import yaml
import glob
import os
import shutil
def read_yaml(file_path):
    with open(file_path, 'r') as stream:
        try:
            return yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)

def read_lines_txt(file_path):
    with open(file_path, 'r') as file:
        return file.readlines()

def generate_annotation_kinetics():
    filenames = ['train_few_shot.txt', 'val_few_shot.txt', 'test_few_shot.txt']
    prefix = ['train', 'val', 'test']
    
    root_dir = 'CLIPFSAR_original_annotations/kinetics100'
    vid_dir = 'data/kinetics/videos'
    
    # extract class id
    class_ids  = {}
    for i, filename in enumerate(filenames):
        path = f'{root_dir}/{filename}'
        lines = read_lines_txt(path)
        lines = [line.split('/') for line in lines]
        cls_ids = {line[3]: line[0] for line in lines}
        class_ids.update(cls_ids)    
    
    # write folder structure to annotation file
    cls_names = os.listdir(vid_dir)
    annotation_data = {i:[] for i in prefix}
    for i, cls_name in enumerate(cls_names):
        # find which split class belongs to
        tmp = class_ids[cls_name[4:]]
        split = None
        for j in prefix:
            if j in tmp:
                split = j
                break
        
        cls_dir = f'{vid_dir}/{cls_name}'
        vid_names = os.listdir(cls_dir)
        vid_paths = [f'{tmp}//{cls_name}/{vid_name}' for vid_name in vid_names]
        annotation_data[split].extend(vid_paths)
    
    annotation_write_dir = 'data/kinetics/annotations'
    os.makedirs(annotation_write_dir, exist_ok=True)
    for split in annotation_data:
        path = f'{annotation_write_dir}/{split}_few_shot.txt'
        with open(path, 'w') as file:
            file.write('\n'.join(annotation_data[split]))

def generate_annotation_ssv2():
    vid_dir = 'data/ssv2/videos'
    cls_names = os.listdir(vid_dir)
    prefix = ['train', 'val', 'test']
    annotation_data = {i:[] for i in prefix}
    for cls in cls_names:
        split_num = cls[4:]
        for j in prefix:
            if j in split_num:
                split = j
                break
        vid_names = os.listdir(f'{vid_dir}/{cls}')
        vid_paths = [f'{split_num}//{cls}/{vid_name}' for vid_name in vid_names]
        annotation_data[split].extend(vid_paths)
    
    annotation_write_dir = 'data/ssv2/annotations'
    os.makedirs(annotation_write_dir, exist_ok=True)
    for split in annotation_data:
        path = f'{annotation_write_dir}/{split}_few_shot.txt'
        with open(path, 'w') as file:
            file.write('\n'.join(annotation_data[split]))
            
def generate_annotation_hmdb51_ucf101():
    files = ['train_few_shot.txt', 'val_few_shot.txt', 'test_few_shot.txt']
    input_dirs = ['CLIPFSAR_original_annotations/hmdb51', 'CLIPFSAR_original_annotations/ucf101']
    output_dirs = ['data/hmdb51/annotations', 'data/ucf101/annotations']
    for i, input_dir in enumerate(input_dirs):
        os.makedirs(output_dirs[i], exist_ok=True)
        for file in files:
            src = f'{input_dir}/{file}'
            dst = f'{output_dirs[i]}/{file}'
            try:
                shutil.copyfile(src, dst)
            except FileExistsError:
                os.remove(dst)  # Remove existing file
                shutil.copyfile(src, dst)  # Copy again
        
    
if __name__ == '__main__':
    generate_annotation_hmdb51_ucf101()
    # generate_annotation_kinetics()
    # generate_annotation_ssv2()
