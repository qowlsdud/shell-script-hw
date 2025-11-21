if [ -d "DB" ]; then
    echo "'DB' 폴더가 이미 존재합니다."
else
    echo "'DB' 폴더가 없으므로 생성합니다."
    mkdir DB
fi

cd DB

touch file1.txt file2.txt file3.txt file4.txt file5.txt

tar -czf files.tar.gz file*.txt

cd ..

if [ ! -d "train" ]; then
    mkdir train
fi

for i in {1..5}
do
    ln -sf ../DB/file$i.txt train/link_file$i.txt
done

ls -l train