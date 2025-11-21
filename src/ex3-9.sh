while true
do
    echo "======================"
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색"
    echo "5) 종료"
    echo "======================"

    read -p "번호를 입력하세요: " menu
    echo ""

    case $menu in
        1)
            echo ">> 팀원 정보를 입력하세요."
            read -p "이름: " name
            read -p "생일 또는 전화번호: " info
            echo "[팀원] $name / $info" >> DB.txt
            echo "저장되었습니다."
            ;;
        2)
            echo ">> 활동 내역을 입력하세요."
            read -p "날짜 (예: 2023-11-21): " date
            read -p "내용: " content
            echo "[활동] $date / $content" >> DB.txt
            echo "저장되었습니다."
            ;;
        3)
            read -p "검색할 팀원 이름을 입력하세요: " search_name
            echo ">> 검색 결과:"
            if [ -f DB.txt ]; then
                grep "$search_name" DB.txt
            else
                echo "데이터가 없습니다."
            fi
            ;;
        4)
            read -p "검색할 날짜 또는 내용을 입력하세요: " search_content
            echo ">> 검색 결과:"
            if [ -f DB.txt ]; then
                grep "$search_content" DB.txt
            else
                echo "데이터가 없습니다."
            fi
            ;;
        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;
        *)
            echo "잘못된 입력입니다. 다시 선택해주세요."
            ;;
    esac

    echo ""
done