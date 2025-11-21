echo "=========================================="
echo "       리눅스 시스템 상태 확인 메뉴       "
echo "=========================================="
echo "1) 사용자 정보 확인 (whoami)"
echo "2) CPU 사용률 확인 (top)"
echo "3) 메모리 사용량 확인 (free)"
echo "4) 디스크 사용량 확인 (df)"
echo "=========================================="

read -p "원하는 기능의 번호를 입력하세요: " choice
echo ""

case $choice in
    1)
        echo "1) 사용자 정보 확인"
        echo "현재 사용자: $(whoami)"
        id
        ;;
    2)
        echo "2) CPU 사용률 확인"
        sleep 2
        top
        ;;
    3)
        echo ">>> 3) 메모리 사용량 확인"
        command -v free &> /dev/null;
        free -h
        ;;
    4)
        echo ">>> 4) 디스크 사용량 확인"
        df -h
        ;;
    *)
        echo "잘못된 번호입니다. 1~4 사이를 입력해주세요."
        ;;
esac