# Xuantruong

# Danh sách câu hỏi
exercises = {
    "Có": "Bạn có yêu tôi không?",
}

# Lệnh để đoán
for exercise, description in exercises.items():
    print(f"Câu hỏi: {description}")
    guess = input("Câu trả lời của bạn là: ")
    
    if guess == exercise:
        print("Đúng rồi! Bạn đã trả lời đúng.\n")
    else:
        print(f"Sai rồi. Câu trả lời đúng là: {exercise}\n")
