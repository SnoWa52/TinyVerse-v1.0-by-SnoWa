# TinyVerse-Farm

TinyVerse-Farm - скрипт для автоматизированного собирания звёздной пыли в телеграме.

### Функция
Автоматизированное собирание звёздной пыли 24/7 каждые 50-75 минут без вашего присутствия.

### Установка

1. **AutoHotKey**
   - Скачайте AutoHotKey последней версии с сайта https://www.autohotkey.com/ или же воспользуйтесь установщиком в архиве скачанным с GitHub`а
  
   - Скачиваем архив с GitHub, распаковываем на рабочий стол.

2. **Mouse Point Viewer**

   - Скачайте Mouse Point Viewer с сайта https://lamerkomp.ru/load/0-0-1-6082-20 или же воспользуйтесь программой в архиве скачанным с GitHub`а

### Использование

1. Запускаем Mouse Point Viewer для определения координат нашей мышки на экране.
2. Открываем файл TinyVerse v1.0 с помощью блокнота, чтобы выставить нужные нам координаты для автоматизации. Нужная нам строчка для координат - Screen Coords.

### Конфигурация
```
#Persistent  | Указывает, что скрипт должен оставаться в памяти
SetTimer, ClickMacro, -1  | Немедленный запуск скрипта
return

; Функция для установки случайного таймера между выполнениями макроса
RandomTimer() {
    Random, TimerDelay, 3000000, 4500000  | Время от 50 до 75 минут в миллисекундах
    SetTimer, ClickMacro, %TimerDelay%  | Устанавливает таймер на случайное время
}

; Главная функция кликов
ClickMacro:
    ; Первый клик - настрой координаты под свою программу
    SmoothMove(X, Y)  | Плавное перемещение мыши в точку (X, Y)
    HumanClick()  | Клик левой кнопкой мыши
    Sleep, PauseTime  | Пауза
    
    ; Второй клик
    SmoothMove(X, Y)  | Плавное перемещение мыши в точку (X, Y)
    HumanClick()
    Sleep, PauseTime

    ; Третий клик
    SmoothMove(X, Y)  | Плавное перемещение мыши в точку (X, Y)
    HumanClick()
    PauseTime, 30000| Пауза в 30 секунд для ожидания загрузки приложения
    Sleep, PauseTime

    ; Четвёртый клик с использованием случайных координат (область клика)
    ; Настрой область под свою программу
    Random, X, СВОИ КООРДИНАТЫ, СВОИ КООРДИНАТЫ  ; Координата X в диапазоне СВОИ КООРДИНАТЫ-СВОИ КООРДИНАТЫ
    Random, Y, СВОИ КООРДИНАТЫ-СВОИ КООРДИНАТЫ  ; Координата Y в диапазоне СВОИ КООРДИНАТЫ-СВОИ КООРДИНАТЫ
    SmoothMove(X, Y)  ; Плавное перемещение мыши в случайную точку в пределах области
    HumanClick()
    Random, PauseTime, 30000, 60000 | Рандомная пауза от 30 до 60 секунд
    Sleep, PauseTime

    ; Пятый клик
    SmoothMove(X, Y)  ; Плавное перемещение мыши в точку (X, Y)
    HumanClick()
    Sleep, PauseTime

    ; Шестой клик
    SmoothMove(X, Y)  ; Плавное перемещение мыши в точку (X, Y)
    HumanClick()

    ; После выполнения всех кликов запускаем таймер заново
    RandomTimer()
return

; Функция для плавного перемещения мыши
; Можно использовать в любой программе, где требуется имитация естественного движения мыши
SmoothMove(x, y) {
    CoordMode, Mouse, Screen  ; Устанавливает относительные координаты для мыши (на весь экран)
    MouseGetPos, startX, startY  ; Получает текущую позицию мыши
    distanceX := x - startX  ; Расстояние по оси X
    distanceY := y - startY  ; Расстояние по оси Y

    steps := 50  ; Количество шагов для плавности движения (можно постепенно увеличивать, если недостаточно плавности)

    ; Цикл для постепенного перемещения мыши
    Loop, %steps% {
        Random, offsetX, -1, 1  ; Случайное отклонение по X для естественности (можно постепенно увеличивать/уменьшать, если недостаточно естественности)
        Random, offsetY, -1, 1  ; Случайное отклонение по Y для естественности (можно постепенно увеличивать/уменьшать, если недостаточно естественности)

        MouseMove, startX + (distanceX * A_Index / steps) + offsetX, startY + (distanceY * A_Index / steps) + offsetY, 0
        Sleep, 15  ; Пауза между шагами (можно уменьшить для ускорения движения)
    }
}

; Функция для имитации клика с естественной задержкой
; Используется в любом месте, где требуется клик мыши
HumanClick() {
    Click down  ; Нажатие кнопки мыши
    Sleep, Random(50, 150)  ; Случайная пауза для имитации реакции человека
    Click up  ; Отпускание кнопки мыши
}
```

### Использование

**Запустите скрипт**

### Пример скрипта с моими координатами:

![image](https://github.com/user-attachments/assets/d1bf7755-615b-4566-8728-3f2e4e9633e3)




### Контакт

Для поддержки или вопросов свяжитесь со мной в Telegram: [@snowabs](https://t.me/snowabs)
