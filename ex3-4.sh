DB_FILE="scores.txt"

touch $DB_FILE

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
    echo ""

    case $menu in
        1)
            echo ">> 과목 점수를 입력하세요 (0~100):"
            read score
            if [[ "$score" =~ ^[0-9]+$ ]] && [ "$score" -le 100 ]; then
                echo $score >> $DB_FILE
                echo "[$score]점이 추가되었습니다."
            else
                echo "오류: 올바른 숫자를 입력해주세요."
            fi
            ;;
        2)
            echo ">> 현재 저장된 점수 목록:"
            if [ -s $DB_FILE ]; then
                cat -n $DB_FILE
            else
                echo "저장된 점수가 없습니다."
            fi
            ;;
        3)
            echo ">> 평균 점수 확인:"
            if [ -s $DB_FILE ]; then
                AVG=$(awk '{ sum += $1 } END { if (NR > 0) printf "%.2f", sum / NR }' $DB_FILE)
                echo "현재 평균 점수는 [ $AVG ]점 입니다."
            else
                echo "계산할 점수가 없습니다."
            fi
            ;;
        4)
            echo ">> 평균 등급(GPA) 변환 (4.5 만점 기준):"
            if [ -s $DB_FILE ]; then
                GPA=$(awk '{
                    score = $1;
                    if (score >= 95) pt = 4.5;
                    else if (score >= 90) pt = 4.0;
                    else if (score >= 85) pt = 3.5;
                    else if (score >= 80) pt = 3.0;
                    else if (score >= 75) pt = 2.5;
                    else if (score >= 70) pt = 2.0;
                    else if (score >= 65) pt = 1.5;
                    else if (score >= 60) pt = 1.0;
                    else pt = 0;
                    
                    sum_pt += pt;
                } END {
                    if (NR > 0) printf "%.2f", sum_pt / NR
                }' $DB_FILE)
                
                echo "당신의 평균 GPA는 [ $GPA / 4.5 ] 입니다."
            else
                echo "변환할 점수가 없습니다."
            fi
            ;;
        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;
        *)
            echo "잘못된 번호입니다. 다시 입력해주세요."
            ;;
    esac

    echo ""
done