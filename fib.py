def main() -> None:
    count: int = int(input())

    num1: int = 0
    num2: int = 1

    while count != 0:
        num1, num2 = num2, num1
        num2 += num1
        count -= 1

    print(num1)

if __name__ == "__main__":
    main()
