while true
do
    echo "======================"
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급(GPA) 변환"
    echo "5) 종료"
    echo "======================"


    read -p "번호를 입력하세요: " menu

    case $menu in
        1)
            echo "1번 선택됨"
            ;;
        2)
            echo "2번 선택됨"
            ;;
        3)
            echo "3번 선택됨"
            ;;
        4)
            echo "4번 선택됨"
            ;;
        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;
        *)
            echo "1~5 사이의 숫자를 입력해주세요."
            ;;
    esac

    echo ""
done