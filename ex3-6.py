import sys

print("프로그램 시작")

args = sys.argv[1:]

if len(args) < 2:
    print("인자가 2개 미만입니다.")
else:
    for i, arg in enumerate(args, 1):
        print(f"인자 {i}: {arg}")

print("프로그램 종료")