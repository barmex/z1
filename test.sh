#!/bin/sh
#Правильно заполненые запросы
curl -d "orderDate=24.07.2021&leadEmail=barashihin@gmail.com&primaryPhone=%2B79273141502&invoiceNumber=SO445533&salesRepresentative=Alex Barashikhin" -X POST http://localhost:5000/
curl -d "primaryPhone=%2B79273141502&leadEmail=barashihin@gmail.com&RMANumber=4433&RMADate=22.02.2021" -X POST http://localhost:5000/
curl -d "feedbackDate=24.07.2021&primaryPhone=%2B79273141502&leadEmail=barashihin@gmail.com&feedbackText=Hello this is feedback text" -X POST http://localhost:5000/
curl -d "requestDate=2021-07-24&callbackPhone=%2B79273141502&callbackReason=Hello this is callback text" -X POST http://localhost:5000/
#Ошибки в ключах и значениях
curl -d "orderDate1=24.07.2021&leadEmail=barashihin@gmail.com&primaryPhone=%2B79273141502&invoiceNumber=SO445533&salesRepresentative=Alex Barashikhin" -X POST http://localhost:5000/
curl -d "primaryPhone=%2B79273141502&leadEmail1=barashihin@gmail.com&RMANumber=4433&RMADate=22.02.2021" -X POST http://localhost:5000/
curl -d "feedbackDate=24.07.2021&primaryPhones=%2B79273141502&leadEmail=barashihin@gmail.com&feedbackText=Hello this is feedback text" -X POST http://localhost:5000/
curl -d "requestDate=24.07.21&callbackPhone=%2B79273141502&callbackReason=%2B79273141502" -X POST http://localhost:5000/
#Большее количество параметров
curl -d "orderDate=24.07.2021&leadEmail=barashihin@gmail.com&primaryPhone=%2B79273141502&invoiceNumber=SO445533&salesRepresentative=Alex Barashikhin&ID=111222111122222" -X POST http://localhost:5000/
curl -d "primaryPhone=%2B79273141502&leadEmail=barashihin@gmail.com&faxNumber=%2B79270000001&RMANumber=4433&RMADate=22.02.2021" -X POST http://localhost:5000/
curl -d "feedbackDate=24.07.2021&primaryPhone=%2B79273141502&leadEmail=barashihin@gmail.com&Parameter=23.04.1990&feedbackText=Hello this is feedback text" -X POST http://localhost:5000/
curl -d "requestDate=24.07.2021&callbackPhone=%2B79273141502&Error=4455&callbackReason=Hello this is callback text" -X POST http://localhost:5000/
#Недостаточно параметров
curl -d "orderDate=24.07.2021&leadEmail=barashihin@gmail.com&invoiceNumber=SO445533&salesRepresentative=Alex Barashikhin" -X POST http://localhost:5000/
curl -d "primaryPhone=%2B79273141502&leadEmail=barashihin@gmail.com&RMADate=22.02.2021" -X POST http://localhost:5000/
curl -d "feedbackDate=24.07.2021&primaryPhone=%2B79273141502&feedbackText=Hello this is feedback text" -X POST http://localhost:5000/
curl -d "rcallbackPhone=%2B79273141502&callbackReason=Hello this is callback text" -X POST http://localhost:5000/