docker build -t secondapp .
docker run -d -p 8082:8080 secondapp
sleep 2
curl http://localhost:8082/SecondApp/SecondApplication?number=10
